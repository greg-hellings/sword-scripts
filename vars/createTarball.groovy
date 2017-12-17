def call() {
	cleanWs()
	sh "svn export '${urlBase}' '${targetDirectory}'"
	dir("${targetDirectory}/scripts") {
		sh "./mkswordtar"
	}
	stash name: "build", includes: "${targetDirectory}.tar.gz"
}
