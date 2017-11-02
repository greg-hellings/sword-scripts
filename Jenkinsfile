node {
	stage("Build test") {
		parallel({
			cleanWs();
			dir("sword") {
				svn url: "https://www.crosswire.org/svn/sword/trunk";
				sh "./autogen.sh";
				sh "./usrinst.sh";
				sh "make -j4";
			}
		},{
			cleanWs();
			dir("sword") {
				svn url: "${svn_url}";
				dir("build") {
					sh "cmake ..";
					sh "make -j4";
				}
			}
		});
}
