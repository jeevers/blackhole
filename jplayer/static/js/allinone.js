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
          height: "405px"
      }
      /*size: {
          width: "720px",
          height: "405px"
      }*/
   })
})

$("#videoentry").click(function() {
   var vidlink = $(this).val();
   alert(vidlink);
})
