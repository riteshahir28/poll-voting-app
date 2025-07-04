package com.pollapp.controller;

import com.pollapp.dao.VoteDAO;
import com.pollapp.dao.connection;
import com.pollapp.model.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/vote")
public class VoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        String pollIdStr = request.getParameter("pollId");
        String selectedOptionStr = request.getParameter("selectedOption");

        // Validate inputs
        if (pollIdStr == null || selectedOptionStr == null) {
            session.setAttribute("error", "Invalid vote submission. Please try again.");
            response.sendRedirect("userDashboard.jsp");
            return;
        }

        try {
            int userId = user.getId();
            int pollId = Integer.parseInt(pollIdStr);
            int optionId = Integer.parseInt(selectedOptionStr);

            Connection con = new connection().getConnection();
            VoteDAO voteDAO = new VoteDAO(con);

            if (voteDAO.hasUserVoted(userId, pollId)) {
                session.setAttribute("error", "You have already voted in this poll.");
            } else {
                boolean success = voteDAO.saveVote(userId, pollId, optionId);
                if (success) {
                    session.setAttribute("success", "Your vote has been submitted successfully!");
                } else {
                    session.setAttribute("error", "Failed to submit your vote. Please try again.");
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            session.setAttribute("error", "Invalid poll or option ID.");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "An unexpected error occurred while voting.");
        }

        // Redirect to dashboard with message
        response.sendRedirect("userDashboard.jsp");
    }
}
