package com.pollapp.controller;

import com.pollapp.dao.PollDAO;
import com.pollapp.model.poll;
import com.pollapp.dao.connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

@WebServlet("/createpoll")
public class CreatePollServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String question = request.getParameter("question");
        String[] optionArray = request.getParameterValues("options");
        String closingTimeStr = request.getParameter("closingTime");

        if (question == null || question.trim().isEmpty() || optionArray == null || optionArray.length < 2 || closingTimeStr == null) {
            request.setAttribute("error", "Please fill all fields and provide at least 2 options.");
            request.getRequestDispatcher("create-poll.jsp").forward(request, response);
            return;
        }

        try {
            List<String> options = Arrays.asList(optionArray);
            LocalDateTime closingTime = LocalDateTime.parse(closingTimeStr);

            poll poll = new poll();
            poll.setQuestion(question);
            poll.setClosingTime(closingTime);
            poll.setStatus("open");

            Connection con = new connection().getConnection();
            PollDAO dao = new PollDAO(con);
            boolean success = dao.createPollWithOptions(poll, options);

            if (success) {
                request.setAttribute("success", "Poll created successfully.");
            } else {
                request.setAttribute("error", "Failed to create poll.");
            }
            request.getRequestDispatcher("create-poll.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid closing time format.");
            request.getRequestDispatcher("create-poll.jsp").forward(request, response);
        }
    }
}
