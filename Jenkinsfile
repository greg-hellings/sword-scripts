pipeline {
	agent any
	environment {
		svn_url = "https://www.crosswire.org/svn/sword/trunk"
	}

	stages {
		stage("Build test") {
			parallel{
				stage("Build - autotools") {
					cleanWs()
					dir("sword") {
						svn url: "${svn_url}"
						sh "${WORKSPACE}/sword-scripts/scripts/autobuild.sh"
					}
				}
				// TODO: CMake build
			}
		}
	}
}


