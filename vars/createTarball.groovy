def call() {
	cleanWs()
	sh "svn export '${urlBase}' '${targetDirectory}'"
	sh "cd '${targetDirectory}/scripts' && ./mkswordtar"
	stash name: "build", includes: "${targetDirectory}.tar.gz"
}
