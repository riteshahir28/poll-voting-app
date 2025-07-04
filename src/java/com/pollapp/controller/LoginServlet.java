package com.pollapp.controller;

import com.pollapp.dao.connection;
import com.pollapp.model.Users;
import com.pollapp.security.PassSec;
import com.pollapp.dao.UsersDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        connection con = new connection();
    
        UsersDao userD = new UsersDao(con.getConnection());
        Users user = userD.LoginDao(email);
        
         
        
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            

            if (user.getRole().equals("admin")) {
                session.setAttribute("role", user);
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("userDashboard.jsp");
            }
        } else {
            request.setAttribute("error", "Invalid email or password");
            RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
            rd.forward(request, response);
        }
    }
}
