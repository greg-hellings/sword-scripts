pipeline {
	agent any
	environment {
		svn_url = "https://www.crosswire.org/svn/sword/trunk"
	}

	stages {
		stage("Checkout") {
			steps {
				cleanWs()
				dir("sword-scripts") {
					checkout scm
				}
				dir("sword") {
					svn url: "${svn_url}"
				}
			}
		}
		stage("Builds") {
			parallel {
				stage("autotools") {
					environment {
						FLAVOR = "autotools"
						SWORD_PATH = "${WORKSPACE}/${FLAVOR}-sword-modules"
					}
					steps {
						dir("sword") {
							sh "./autogen.sh"
							sh "${WORKSPACE}/sword-scripts/scripts/autobuild.sh"
						}
						sh "${WORKSPACE}/sword-scripts/scripts/test.sh"
					}
				}
				stage("CMake") {
					environment {
						FLAVOR = "cmake"
						SWORD_PATH = "${WORKSPACE}/${FLAVOR}-sword-modules"
					}
					steps {
						dir("sword") {
							sh "${WORKSPACE}/sword-scripts/scripts/cmake.sh"
						}
						sh "${WORKSPACE}/sword-scripts/scripts/test.sh"
					}
				}
			}
		}
	}
}


