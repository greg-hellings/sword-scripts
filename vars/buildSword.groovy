def call(String flavor) {
	cleanWs()
	unstash "build"
	sh "tar xaf ${targetDirectory}.tar.gz"
	dir("sword-scripts") {
		checkout scm
	}
	dir(targetDirectory) {
		sh "${WORKSPACE}/sword-scripts/scripts/${flavor}.sh ${flavor}"
	}
	sh "${WORKSPACE}/sword-scripts/scripts/test.sh ${flavor}"
}
