/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pollapp.controller;

import com.pollapp.dao.connection;
import com.pollapp.dao.UsersDao;
import com.pollapp.model.Users;
import com.pollapp.security.PassSec;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // if roll will be anything like hacker,teacher,etc then it ignore and set by default user;
        if (!role.equals("user") && !role.equals("admin")) {
            role = "user";  // default safe fallback
        }
        
        

        String salt = PassSec.getSalt();
        String encPass = PassSec.hashPassword(password, salt);
        Users user = new Users(name,email,encPass,role,salt);
        
       
         

        // Register
        connection con = new connection();
        UsersDao dao = new UsersDao(con.getConnection());
        //if any other try second admin register then will be redirect to error page;
        if(dao.checkAD(email))
        {
            
            response.sendRedirect("error.jsp");
            return;
        }
        
        boolean result = dao.registerUser(user);

        // Response
        if (result) {
            request.setAttribute("success", "Registration successful. You can now login.");
        } else {
            request.setAttribute("error", "Email already exists or something went wrong.");
        }

        // Forward back to register.jsp
        RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
        rd.forward(request, response);
    }
}
