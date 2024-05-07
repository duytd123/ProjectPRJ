/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOUsers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Users;

/**
 *
 * @author badao
 */
public class AdminControlAccount extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminControlAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminControlAccount at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        DAOUsers dao = new DAOUsers();
        List<Users> list = dao.getAllUsersByRole();
        request.setAttribute("datauser", list);
        int count = dao.getTotalUsers();
        int endpage = count / 18;
        if (count % 3 != 0) {
            endpage++;
        }
        String index1 = request.getParameter("index");
        if (index1 == null) {
            index1 = "1";
        }
        int index = Integer.parseInt(index1);
        List<Users> list1 = dao.getUsersOffFetch(index);
        request.setAttribute("list", list);
        request.setAttribute("list1", list1);
        request.setAttribute("endpage", endpage);
        request.getRequestDispatcher("Account.jsp").forward(request, response);
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
        String name = request.getParameter("usersearch");
        DAOUsers dao = new DAOUsers();
        Users u = dao.checkUsers(name);
        List<Users> list = dao.getAllUsersByRole();
        if (u == null) {
            request.setAttribute("result", "Not found user...please enter again!");
            request.setAttribute("datauser", list);
            request.getRequestDispatcher("Account.jsp").forward(request, response);
        } else {
            request.setAttribute("user", u);
            request.getRequestDispatcher("Account.jsp").forward(request, response);
        }
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
