/*       $(document).ready(function(){
$("#jquery_jplayer_1").jPlayer({
           ready: function () {
             $(this).jPlayer("setMedia", {
               m4v: "/videos/{{ escape(filepath) }}"
             });
           },
           swfPath: "/static/js",
           supplied: "m4v"
         });
       });   */ 
    
$(document).ready(function(){
    $("#jquery_jplayer_1").jPlayer({
      size: {
          width: "720px",
          height: "405px",
          cssClass: "jp-video-405p"
      }
      /*size: {
          width: "720px",
          height: "405px"
      }*/
    });

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
         supplied: "m4v",
         size: {
            width: "720px",
            height: "405px",
            cssClass: "jp-video-405p"
         }
       });
       $("#playerfilename").text(filename);
       setTimeout(function(){$("#jquery_jplayer_1").jPlayer("play")},2000)
    });
});
