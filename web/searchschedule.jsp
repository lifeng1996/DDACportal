<%-- 
    Document   : searchschedule
    Created on : Apr 5, 2018, 8:26:01 PM
    Author     : tan
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
              <table class="table table-hover" id="scheduletable">
                            <thead>
      <tr>
          <th>Schedule ID</th>
          <th>From</th>
        <th>Destination</th>
        <th>Date</th>
        <th>Time</th>
        <th>Remaining Capacity</th>
        <th><div align="center"> 
                Operation</div></th>
      </tr>
    </thead>
    <tbody>
                            
                        <%
                            String from = request.getParameter("source");
                            String to = request.getParameter("destination");
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
           sql = "SELECT * from Schedule WHERE SOURCE=\'"+from+"\' AND DESTINATION=\'"+to+"\'";
           ResultSet rs = stmt.executeQuery(sql);
           int x = 0;
           while(rs.next()){
               %>
               <tr>
          <td><%= rs.getString("SID")%></td>
           <td><%= rs.getString("SOURCE")%></td>
          <td><%=rs.getString("DESTINATION")%></td>
        <td><%=rs.getString("SHIPDATE")%></td>
        <td><%=rs.getString("SHIPTIME")%></td>
        <td><%=rs.getString("CAPACITY")%></td>
        <td class="text-center">
            <div>
                <div class="col-sm-6 "
            <form id="deletation" action="AgentResetPasswordServlet" method="POST">
                                        <input type="hidden" name="adid" id="adid" value="<%=rs.getString(1)%>">
                                        <a ><button class="btn btn-default btn-sm">Delete Schedule</button></a>
                                    </form>
            </div>
                                        <div class="col-sm-6">
                                        <a href="adminviewschedule.jsp?sid=\"<%=rs.getString(1)%>\"" ><button class="btn btn-default btn-sm">View Detail</button></a>
            </div></div>
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
function searchid() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("keyword");
  filter = input.value.toUpperCase();
  table = document.getElementById("scheduletable");
  tr = table.getElementsByTagName("tr");
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
}


</script>
    </body>
</html>
