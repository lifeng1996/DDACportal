/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Customer;
import Model.Items;
import Model.Schedule;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author tan
 */
public class CreateBookingServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        Customer c = (Customer) session.getAttribute("customer");
        Items i = (Items) session.getAttribute("item");
        Schedule s = (Schedule) session.getAttribute("schedule");
        String status = "Pending";
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
           sql = "INSERT INTO Items(ITEM_NAME,ITEM_CATEGORY,QUANTITY,WEIGHT,CUSTOMER_ID) VALUES ('"+i.getName()+"','"+i.getCategory()+"',"+Integer.parseInt(i.getQuantity())+","+Float.parseFloat(i.getWeight())+","+i.getC().getId()+")";
           stmt.executeUpdate(sql);
           sql = "SELECT TOP 1 * FROM Items ORDER BY IID DESC";
          ResultSet rs = stmt.executeQuery(sql);
           if(rs.next()){
               i.setId(rs.getLong("IID"));
           }
           sql = "INSERT INTO Booking(STATUS,CUSTOMER_ID,SCHEDULE_ID,ITEM_ID) VALUES('"+status+"',"+c.getId()+","+s.getId()+","+i.getId()+")";
           stmt.executeUpdate(sql);
           stmt.close();
           out.println("<script type=\"text/javascript\">");
   out.println("alert('Booking is created Successfully and waiting for approval!');");
   out.println("location='agenthome.jsp';");
   out.println("</script>");
               
 
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
