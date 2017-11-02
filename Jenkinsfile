node {
	stage("Build test") {
		cleanWs();
		dir("sword-1-8-x") {
			svn url: "https://www.crosswire.org/svn/sword/branches/sword-1-8-x";
			sh "./autogen.sh";
			sh "./usrinst.sh";
			sh "make -j4";
		}
	}
}
