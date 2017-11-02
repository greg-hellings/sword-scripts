node {
	stage("Build test") {
		cleanWs();
		dir("sword") {
			svn url: "https://www.crosswire.org/svn/sword/trunk";
			sh "./autogen.sh";
			sh "./usrinst.sh";
			sh "make -j4";
		}
	}
}
