<%-- 
    Document   : logout
    Created on : Jan 14, 2018, 4:00:10 PM
    Author     : tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
 $(document).ready(function(){
        $("#myLogout").modal('show');
        setTimeout(function(){ window.location.href='homepage.jsp'; }, 5000);
    });
    function tohome(){
        window.location.href = "homepage.jsp";
    }
    
</script>
        <title>Logout</title>
    </head>
    <body>
        <div id="myLogout" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Logout Successfully!</h4>
      </div>
      <div class="modal-body">
        <p>Redirect you to Maersk Line Homepage in 5 seconds.</p>
      </div>
      <div class="modal-footer">
          <button id="closebutton" type="button" class="btn btn-default" data-dismiss="modal" onclick="tohome()">Close</button>
      </div>
    </div>

  </div>
</div>
        
    </body>
</html>
