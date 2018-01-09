pipeline {
	agent any
	environment {
		svn_url = "https://www.crosswire.org/svn/sword/trunk"
		targetDirectory = "sword"
	}

	stages {
		stage("Checkout") {
			steps {
				cleanWs()
				dir("sword-scripts") {
					checkout scm
				}
				dir(targetDirectory) {
					svn url: "${svn_url}"
					sh "./autogen.sh"
				}
				sh "tar caf ${targetDirectory}.tar.gz ${targetDirectory}"
				stash name: "build", includes: "${targetDirectory}.tar.gz"
			}
		}
		stage("Builds") {
			parallel {
				stage("autotools") {
					agent any
					environment {
						SWORD_PATH = "${WORKSPACE}/${FLAVOR}-sword-modules"
					}
					steps {
						buildSword("autotools")
					}
				}
				stage("CMake") {
					agent any
					environment {
						SWORD_PATH = "${WORKSPACE}/${FLAVOR}-sword-modules"
					}
					steps {
						buildSword("cmake")
					}
				}
			}
		}
	}
}


