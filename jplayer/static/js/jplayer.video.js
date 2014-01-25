$(document).ready(function(){
	$("#jquery_jplayer_1").jPlayer({
		ready: function () {
			$(this).jPlayer("setMedia", {
				m4v: "http://localhost:8081/videos/Big_Bad_Wolf-Duck_Sauce.mp4"
			});
		},
		swfPath: "/static/js",
		supplied: "m4v"
	});
});
