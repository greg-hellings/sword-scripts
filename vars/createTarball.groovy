def call() {
	cleanWs()
	sh "svn export '${urlBase}' '${targetDirectory}'"
	dir("${targetDirectory}/scripts") {
		sh "/bin/bash -x mkswordtar"
	}
	stash name: "build", includes: "${targetDirectory}.tar.gz"
}
