<%-- 
    Document   : employerhome
    Created on : 2018-1-4, 19:41:29
    Author     : tan
--%>

<%@page import="java.sql.SQLException"%>
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

        </script>
        <title>Admin-agent</title>
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
                    <div class="searchbox">
                        <h2>Search Agent</h2>
                        Enter your search criteria.
                        <br>
                        <div class="search-container">
                                <input type="text" placeholder="Enter Agent Name or ID.." name="search" id="keyword" onkeyup="search()" >
                                
                               <a href="adminaddagent.jsp"><button class="btn btn-default">Add Agent</button></a>
                             
                            <hr>
                        </div>
                    </div>
                    <div  id="contentbox2">
                        <table class="table table-hover" id="agenttable">
                            <thead>
      <tr>
          <th>Agent ID</th>
          <th>UserName</th>
        <th>Name</th>
        <th>Nation</th>
        <th>State</th>
        <th><div align="center"> 
                Operation</div></th>
      </tr>
    </thead>
    <tbody>
                            
                        <%
                            Connection conn = null;
           Statement stmt = null;
 String driver ="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        try {
              try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
            String dbURL = "jdbc:sqlserver://ddacportal.database.windows.net:1433;databaseName=DDACportal";
            String user = "lifeng1996";
            String pass = "4ag5jfpA?!";
            conn = DriverManager.getConnection(dbURL, user, pass);
           stmt = conn.createStatement();
           String sql;
           sql = "SELECT * from Agent";
           ResultSet rs = stmt.executeQuery(sql);
           int x = 0;
           while(rs.next()){
               %>
               <tr>
          <td><%= rs.getString("UID")%></td>
           <td><%= rs.getString("USERNAME")%></td>
          <td><%=rs.getString("NAME")%></td>
        <td><%=rs.getString("NATION")%></td>
        <td><%=rs.getString("STATE")%></td>
        <td class="text-center">     
            <form id="deletation" action="AgentResetPasswordServlet" method="POST">
                                        <input type="hidden" name="adid" id="adid" value="<%=rs.getString(1)%>">
                                        <a ><button class="btn btn-default btn-sm">Reset Password</button></a>
                                    </form>
                                   
        </td>
  </tr>
               
               <%
           }
                rs.close();
                stmt.close();
                conn.close();
            
               
 
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
                        %>
    </tbody>
                        </table>
    
                    </div>
    <script>
function search() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("keyword");
  filter = input.value.toUpperCase();
  table = document.getElementById("agenttable");
  tr = table.getElementsByTagName("tr");
  if (/^\d+$/.test(document.getElementById("keyword").value)){
    // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}else{
    // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
    
  }
}

  
}
</script>
                </div>
                <div class="col-sm-3 sidenav">
              
          </div>
                </div>
            </div>
        </div> 
    </body>
</html>
