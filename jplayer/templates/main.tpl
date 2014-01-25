<!DOCTYPE html>
<html>
  <head>
    <title>VIDEOS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/css/bootstrap-glyphicons.css" rel="stylesheet" media="screen">
    <!-- JavaScript plugins (requires jQuery) -->
    <script src="/static/js/jquery-2.0.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
  </head>
  <body>
    <table>
      <thead>
        <tr>
          <th>File</th><th>Date</th>
        </tr>
      </thead>
      <tbody>
        {% for file in filelist %}
          <tr>
            <td><a href={{ escape(file[1]) }}>{{ escape(file[0]) }}</a></td>
            <td>{{ escape(file[2]) }}</td> 
          </tr>
        {% end %}
      </tbody>
    </table>
  </body>
</html>

