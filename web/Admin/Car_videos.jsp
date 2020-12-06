<%-- 
    Document   : Car_videos
    Created on : 11 Jun, 2020, 8:46:16 PM
    Author     : Sarath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car videos</title>
        <%@include file="HomePage.jsp" %>
        <style>
        #myvideo {
  
            width: 300px;
            height: 300px;

}
        </style>
    </head>
    <body>
        <div id="tab" align="center">
        

<video width="100%" controls id="myvideo">
  <source src="../Admin/Videos/rain.mp4" type="video/mp4">
  <source src="../Admin/Videos/rain.ogg" type="video/ogg">
  Your browser does not support the video tag.
</video>


<script>
var elem = document.getElementById("myvideo");
function openFullscreen() {
  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.mozRequestFullScreen) { /* Firefox */
    elem.mozRequestFullScreen();
  } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) { /* IE/Edge */
    elem.msRequestFullscreen();
  }
}
</script>

        
        </div>

    </body>
</html>
