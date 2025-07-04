package com.pollapp.controller;

import com.pollapp.dao.PollDAO;
import com.pollapp.dao.connection;
import com.pollapp.model.poll;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;

@WebServlet("/editpoll")
public class EditPollServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int pollId = Integer.parseInt(request.getParameter("pollId"));
        String question = request.getParameter("question");
        String closingTimeStr = request.getParameter("closingTime");

        try {
            LocalDateTime closingTime = LocalDateTime.parse(closingTimeStr);

            poll p = new poll();
            p.setId(pollId);
            p.setQuestion(question);
            p.setClosingTime(closingTime);

            Connection con = new connection().getConnection();
            PollDAO dao = new PollDAO(con);
            dao.updatePoll(p);

            response.sendRedirect("adminDashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid data format.");
            request.getRequestDispatcher("edit-poll.jsp").forward(request, response);
        }
    }
}
