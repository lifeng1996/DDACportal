/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tan
 */
public class BookingOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("adid");
        String operation = request.getParameter("operation");
        float weight = 0, capacity = 0;
        String sid = null;
        PrintWriter out = response.getWriter();
        try {
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
           sql = "SELECT * from Booking b,Schedule s, Customer c, Items i WHERE b.BID = "+id+" and b.CUSTOMER_ID = c.CID and b.SCHEDULE_ID=s.SID and b.ITEM_ID=i.IID ORDER BY BID DESC";
          ResultSet rs = stmt.executeQuery(sql);
           if(rs.next()){
               capacity = rs.getFloat("CAPACITY");
               weight = rs.getFloat("WEIGHT");
               sid = rs.getString("SID");
           }
           rs.close();
           if(operation.equalsIgnoreCase("Approve")){
               capacity = capacity - weight;
               sql = "UPDATE Schedule SET CAPACITY = "+capacity+" WHERE SID = "+sid;
               stmt.executeUpdate(sql);
               sql = "UPDATE Booking SET STATUS = '"+operation+"' WHERE BID =" +id;
               stmt.executeUpdate(sql);
               out.println("<script type=\"text/javascript\">");
   out.println("alert('The booking is confirmed and updated to the Schedule!');");
   out.println("location='adminhome.jsp';");
   out.println("</script>");
           }else if(operation.equalsIgnoreCase("Decline")){
                sql = "UPDATE Booking SET STATUS = '"+operation+"' WHERE BID =" +id;
               stmt.executeUpdate(sql);
               out.println("<script type=\"text/javascript\">");
   out.println("alert('The booking is Declined');");
   out.println("location='adminhome.jsp';");
   out.println("</script>");
           }
           
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
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
