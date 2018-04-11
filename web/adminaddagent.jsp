<%-- 
    Document   : employerhome
    Created on : 2018-1-4, 19:41:29
    Author     : tan
--%>

<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
      // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
            function reloadFunction() {
                window.location.reload();
            }
            function validatePassword() {
            var pass2 = document.getElementById("regispwd").value;
            var pass1 = document.getElementById("conpwd").value;
            if (pass1 != pass2)
                    document.getElementById("conpwd").setCustomValidity("Passwords Don't Match");
            else
                    document.getElementById("conpwd").setCustomValidity('');
            //empty string means no validation error
            }
            function checkbeforesubmit(){
                var username = document.getElementById("announce1").textContent;
                if(username == "User Available!"){
                    document.getElementById("regisemail").setCustomValidity('');
                }else{
                    document.getElementById("regisemail").setCustomValidity('User Not Available! Please another username');
                }
                validatePassword();
                check();
            }
            function check() {
            if (document.getElementById("regispwd").value ===
                    document.getElementById("conpwd").value) {
            document.getElementById("message").style.color = 'green';
            document.getElementById("message").innerHTML = 'Matching';
            document.getElementById("submitbutton");
            } else {
            document.getElementById("message").style.color = 'red';
            document.getElementById("message").innerHTML = 'Not Matching';
            }
            }
            ;

        </script>
        <title>Admin-addagent</title>
        <style>
            #band{
                 min-height: 600px;
                height:100%;
            }
            body{
                height: 100%;
        background-color: #f1f1f1;
    }
            .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
            #contentbox{
                height:100%;
        background-color:white;
    }
            body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
  }
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 20px;
      color: #111;
  }
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 80%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h1 {
      color: #f1f1f1 !important;
  }
  @media (max-width: 600px) {
      
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }
  .nav-tabs li a {
      color: #777;
  }
  #googleMap {
      width: 100%;
      height: 400px;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);
  }  
  .navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      background-color: #000;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
      opacity: 0.8;
      height: 80px
  }
  .navbar li a, .navbar .navbar-brand { 
      color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
      color: #fff !important;
  }
  .navbar-nav li.active a {
      color: #fff !important;
      background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
  }
  .open .dropdown-toggle {
      color: #fff;
      background-color: #555 !important;
  }
  .dropdown-menu li a {
      color: #000 !important;
  }
  .dropdown-menu li a:hover {
      background-color: red !important;
  }
  footer {
      background-color: #2d2d30;
      color: #f5f5f5;
      padding: 32px;
  }
  footer a {
      color: #f5f5f5;
  }
  footer a:hover {
      color: #777;
      text-decoration: none;
  }  
  .form-control {
      border-radius: 0;
  }
  textarea {
      resize: none;
  }
        </style>
    </head>
    <body>
        <nav class="navbar  navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
            <a class="navbar-brand" onClick="window.location.reload()"><img style="opacity: 0.8" alt="MaerskLine" src="logo.png" width="150" height="65"></a>
      <ul class="nav navbar-nav navbar-left">
        <li><a href="adminhome.jsp">HOME</a></li>
        <li><a href="adminagents.jsp">AGENTS</a></li>
        <li><a href="adminhome.jsp">SHIPPING SCHEDULE</a></li>
        <li><a href="adminbookings.jsp">BOOKINGS</a></li>
       
      </ul>
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
       <ul class="nav navbar-nav navbar-right">
        <li><a href="LogoutServlet" class="glyphicon glyphicon-log-in">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
        
           <br> <br><br> 
        <div id="band" class="container-fluid text-center">  
            
            <div class="row content">
                
                <div class="col-sm-3 sidenav">
                </div>
                <div id="contentbox" class="col-sm-6 text-justify">
                     <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="">
        <div class="modal-header">
          <h4 class="modal-title">Registration</h4>
        </div>
        <div class="modal-body">
          <form action="RegisterServlet" method="POST">
    <div class="form-group">
      <label for="username">Username: </label><p id="announce"></p>
      <input type="username" class="form-control" id="regisemail" name="regisemail" placeholder="Enter Login username" onchange="search()" required>
      
      <script>
         
function search() {
  var str1 = document.getElementById("regisemail").value;
  var xhttp;    
  if (str1 == "") {
    document.getElementById("announce").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("announce").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "searchuser.jsp?keyword="+str1, true);
  xhttp.send();
}
</script>
    </div>
               <div class="form-group">
      <label for="agentname">Agent Name:</label>
      <input type="username" class="form-control" id="regisname" name="regisname" placeholder="Enter Agent Name" required>
    </div>
              <div class="form-group">
      <label for="nation">Nation:</label>
      <input type="username" class="form-control" id="nation" name="nation" placeholder="Enter Nation" required>
    </div>
              <div class="form-group">
      <label for="state">State:</label>
      <input type="username" class="form-control" id="state" name="state" placeholder="Enter State" required>
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="regispwd" name="regispwd" placeholder="Enter password" onkeyup="check()" required>
    </div>
    <div class="form-group">
      <label for="pwd">Confirmed Password:</label><span id='message'></span>
      <input type="password" class="form-control" id="conpwd" placeholder="Enter password again" onkeyup="check()" required>
    </div>
              <br>
    <button type="submit" class="btn btn-default" onclick="return checkbeforesubmit()">Submit</button>
  </form>
        </div>
        <div class="modal-footer">
            <div class="col-sm-6">
                
            </div>
            <div class="col-sm-6">
        </div>
      </div>
    </div>
  </div>
                </div>
                <div class="col-sm-3 sidenav">
              
          </div>
                </div>
            </div>
        </div> 
    </body>
</html>
