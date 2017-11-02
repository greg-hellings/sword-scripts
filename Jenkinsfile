pipeline {
	agent any
	environment {
		svn_url = "https://www.crosswire.org/svn/sword/trunk"
	}

	stages {
		parallel{
			stage("Build - autotools") {
				environment {
					SWORD_PATH = "${WORKSPACE}/sword-modules"
				}
				steps {
					cleanWs()
					dir("sword-scripts") {
						checkout scm
					}
					dir("sword") {
						svn url: "${svn_url}"
						sh "./autogen.sh"
						sh "${WORKSPACE}/sword-scripts/scripts/autobuild.sh"
					}
					sh "${WORKSPACE}/sword-scripts/scripts/test.sh"
				}
			}
			// TODO: CMake build
		}
	}
}


