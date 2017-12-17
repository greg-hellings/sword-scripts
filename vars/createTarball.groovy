def call() {
	cleanWs()
	sh "svn export '${urlBase}' '${targetDirectory}'"
	dir("${targetDirectory}/scripts") {
		sh "set -v && ./mkswordtar"
	}
	stash name: "build", includes: "${targetDirectory}.tar.gz"
}
