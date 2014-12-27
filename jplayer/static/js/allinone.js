var size_270p = {size: {
    width: "480px",
    height: "270px",
    cssClass: "jp-video-270p"
}};
var size_405p = {size: {
    width: "720px",
    height: "405px",
    cssClass: "jp-video-405p"
}};
    
$(document).ready(function(){
    $("#jquery_jplayer_1").jPlayer(size_270p);

    $(".videoentry").click(function() {
       var vidlink = $(this).attr("data-file-path");
       var filename = $(this).text();
       //alert("filename: " + filename + "\npath: " + vidlink);
       $("#jquery_jplayer_1").jPlayer("destroy");
       $("#jquery_jplayer_1").jPlayer({
         ready: function() {
            $(this).jPlayer("setMedia",{
               m4v: vidlink
            });
         },
         swfPath:"/static/js",
         supplied: "m4v"
       });
       $("#playerfilename").text(filename);
       setTimeout(function(){$("#jquery_jplayer_1").jPlayer("play")},2000)
    });

    $("#resize-full-toggle").click(function(e){
        e.preventDefault();
        $("#jquery_jplayer_1").jPlayer(size_405p);
    });

    $("#resize-small-toggle").click(function(e){
        e.preventDefault();
        $("#jquery_jplayer_1").jPlayer(size_270p);
    });

    var options = {
       valueNames: [ 'name', 'date' ]
    };
    var filelist = new List('filelist', options);
});

