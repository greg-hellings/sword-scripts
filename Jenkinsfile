def svn_url = "https://www.crosswire.org/svn/sword/trunk";

node {
	stage("Build test") {
		def builds = [:];
		builds["autotools"] = {
			cleanWs();
			dir("sword") {
				svn url: "${svn_url}";
				sh "./autogen.sh";
				sh "./usrinst.sh";
				sh "make -j4";
			}
		};
		biulds["CMake"] = {
			cleanWs();
			dir("sword") {
				svn url: "${svn_url}";
				dir("build") {
					sh "cmake ..";
					sh "make -j4";
				}
			}
		};
		parallel(builds);
	}
}
