def call() {
	cleanWs()
	sh "svn export '${urlBase}' '${targetDirectory}'"
	sh "cd '${targetDirectory}/scripts' && /bin/bash -x mkswordtar"
	stash name: "build", includes: "${targetDirectory}.tar.gz"
}
