package com.pollapp.controller;

import com.pollapp.dao.PollDAO;
import com.pollapp.dao.connection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/closepoll")
public class ClosePollServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int pollId = Integer.parseInt(request.getParameter("pollId"));
        PollDAO dao = new PollDAO(new connection().getConnection());
        dao.closePoll(pollId);

        response.sendRedirect("adminDashboard.jsp");
    }
}
