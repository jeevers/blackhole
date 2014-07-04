<!DOCTYPE html>
<html>
  <head>
    <title>VIDEOS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/bootstrap-glyphicons.css" rel="stylesheet" media="screen">
    <!-- Additional CSS templates -->
    <link href="/static/skin/jplayer.midnight.black.css" rel="stylesheet" media="screen">
    <link href="/static/css/allinone.css" rel="stylesheet" media="screen">
    <!-- JavaScript plugins (requires jQuery) -->
    <script src="/static/js/jquery-2.0.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/jquery.jplayer.min.js"></script>
    <script src="/static/js/allinone.js"></script>
  </head>
  <body>
    <div id="filelist">
      <table>
        <thead>
          <tr>
            <th>File</th><th>Date</th>
          </tr>
        </thead>
        <tbody>
          {% for file in filelist %}
            <tr>
              <td><a data-file-path={{ escape(file[1]) }}>{{ escape(file[0]) }}</a></td>
              <td>{{ escape(file[2]) }}</td> 
            </tr>
          {% end %}
        </tbody>
      </table>
    </div>
  <div id="jp_container_1" class="jp-video ">
    <div class="jp-type-single">
      <div id="jquery_jplayer_1" class="jp-jplayer"></div>
      <div class="jp-gui">
        <div class="jp-video-play">
          <a href="javascript:;" class="jp-video-play-icon" tabindex="1">play</a>
        </div>
        <div class="jp-interface">
          <div class="jp-progress">
            <div class="jp-seek-bar">
              <div class="jp-play-bar"></div>
            </div>
          </div>
          <div class="jp-current-time"></div>
          <div class="jp-duration"></div>
          <div class="jp-controls-holder">
            <ul class="jp-controls">
              <li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
              <li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
              <li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
              <li><a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a></li>
              <li><a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li>
              <li><a href="javascript:;" class="jp-volume-max" tabindex="1" title="max volume">max volume</a></li>
            </ul>
            <div class="jp-volume-bar">
              <div class="jp-volume-bar-value"></div>
            </div>
            <ul class="jp-toggles">
              <li><a href="javascript:;" class="jp-full-screen" tabindex="1" title="full screen">full screen</a></li>
              <li><a href="javascript:;" class="jp-restore-screen" tabindex="1" title="restore screen">restore screen</a></li>
              <li><a href="javascript:;" class="jp-repeat" tabindex="1" title="repeat">repeat</a></li>
              <li><a href="javascript:;" class="jp-repeat-off" tabindex="1" title="repeat off">repeat off</a></li>
            </ul>
          </div>
          <div class="jp-title">
            <ul>
              <li id="playerfilename">File Not Yet Loaded</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="jp-no-solution">
        <span>Update Required</span>
        To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
      </div>
    </div>
  </div>
  </body>
</html>

