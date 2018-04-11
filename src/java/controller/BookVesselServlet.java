/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.Customer;
import Model.Schedule;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tan
 */
public class BookVesselServlet extends HttpServlet {

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
        String bookstep = (String) session.getAttribute("step");
        String laststep = (String) session.getAttribute("laststep");
        PrintWriter out = response.getWriter();
        try {
            if(laststep==null || laststep.equalsIgnoreCase(request.getParameter("step"))){
                bookstep = "0";
            }
           if(bookstep==null || bookstep.equalsIgnoreCase("0")){          
        String step = request.getParameter("step");
            bookstep = "1";
            session.setAttribute("step", bookstep);
        if(step.equalsIgnoreCase("1")){
            String id = request.getParameter("cid");
            String name = request.getParameter("name");
            String nation = request.getParameter("nation");
            String ic = request.getParameter("ic");
            String gentle = request.getParameter("gentle");
            String contact = request.getParameter("phone");
            String address = request.getParameter("address");
            Customer cus = new Customer(name,ic,gentle,nation,address,contact);
            cus.setId(Long.parseLong(id));
            session.setAttribute("laststep", step);
            session.setAttribute("customer", cus);
             out.println("<script type=\"text/javascript\">");
   out.println("alert('Please Choose a Shipping Schedule!');");
   out.println("location='agenthome.jsp';");
   out.println("</script>");
        }else{
            String sid = request.getParameter("sid");
            String source = request.getParameter("source");
            String destination = request.getParameter("destination");
            String date = request.getParameter("shipdate");
            String time = request.getParameter("shiptime");
            String capacity = request.getParameter("capacity");
            Schedule sche = new Schedule(time,source,destination,capacity,time);
            sche.setId(Long.parseLong(sid));
            session.setAttribute("laststep", step);
            session.setAttribute("schedule", sche);
             out.println("<script type=\"text/javascript\">");
   out.println("alert('Select the registered Customer.');");
   out.println("location='agentcustomer.jsp';");
   out.println("</script>");
        }
        }else if(bookstep.equalsIgnoreCase("1")){
            String step = request.getParameter("step");
            bookstep = "0";
            session.setAttribute("step", bookstep);
        if(step.equalsIgnoreCase("1")){
            String id = request.getParameter("cid");
            String name = request.getParameter("name");
            String nation = request.getParameter("nation");
            String ic = request.getParameter("ic");
            String gentle = request.getParameter("gentle");
            String contact = request.getParameter("phone");
            String address = request.getParameter("address");
            Customer cus = new Customer(name,ic,gentle,nation,address,contact);
            cus.setId(Long.parseLong(id));
            session.setAttribute("laststep", step);
            session.setAttribute("customer", cus);
            out.println("<script type=\"text/javascript\">");
   out.println("alert('Please insert the Item Information');");
   out.println("location='agentregisteritem.jsp';");
   out.println("</script>");
            
        }else{
            String sid = request.getParameter("sid");
            String source = request.getParameter("source");
            String destination = request.getParameter("destination");
            String date = request.getParameter("shipdate");
            String time = request.getParameter("shiptime");
            String capacity = request.getParameter("capacity");
            Schedule sche = new Schedule(time,source,destination,capacity,time);
            sche.setId(Long.parseLong(sid));
            session.setAttribute("laststep", step);
            session.setAttribute("schedule", sche);
            out.println("<script type=\"text/javascript\">");
   out.println("alert('Please insert the Item Information');");
   out.println("location='agentregisteritem.jsp';");
   out.println("</script>");
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
