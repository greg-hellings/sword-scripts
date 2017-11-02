def svn_url = "https://www.crosswire.org/svn/sword/trunk";

stage("Build test") {
	def builds = [:];
	builds["autotools"] = {node{
		cleanWs();
		dir("sword") {
			svn url: "${svn_url}";
			sh "./autogen.sh";
			sh "./usrinst.sh";
			sh "make -j4";
		}
	}};
	builds["CMake"] = {node{
		cleanWs();
		dir("sword") {
			svn url: "${svn_url}";
			dir("build") {
				sh "cmake ..";
				sh "make -j4";
			}
		}
	}};
	parallel(builds);
}
