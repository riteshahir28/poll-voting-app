<%@ page import="java.util.*, com.pollapp.model.*, com.pollapp.dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String pollIdStr = request.getParameter("pollId");
    if (pollIdStr == null) {
        response.sendRedirect("userDashboard.jsp");
        return;
    }

    int pollId = Integer.parseInt(pollIdStr);
    connection con = new connection();
    PollDAO pollDAO = new PollDAO(con.getConnection());
    VoteDAO voteDAO = new VoteDAO(con.getConnection());

    poll pollData = pollDAO.getPollById(pollId);
    List<Option> options = pollDAO.getOptionObjectsByPollId(pollId);

    Map<Integer, Integer> voteCountMap = voteDAO.getVoteCountByPollId(pollId);
    int totalVotes = voteDAO.getTotalVotesByPollId(pollId);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Poll Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f7fa;
        }

        .progress {
            height: 25px;
        }
        .progress-bar {
            font-weight: bold;
        }
    </style>
</head>
<body>

<jsp:include page="User-navbar.jsp" />

<div class="container mt-5">
    <h3>Poll Results</h3>
    <h5 class="mb-4"><%= pollData.getQuestion() %></h5>

    <% if (totalVotes == 0) { %>
        <div class="alert alert-warning">No votes have been submitted for this poll.</div>
    <% } else { %>
        <p><strong>Total Votes:</strong> <%= totalVotes %></p>
        <% for (Option opt : options) {
            int count = voteCountMap.getOrDefault(opt.getId(), 0);
            double percent = (count * 100.0) / totalVotes;
        %>
            <div class="mb-3">
                <div><strong><%= opt.getOptionText() %> — <%= count %> votes ( <%= String.format("%.2f", percent) %>% )</strong></div>
                <div class="progress">
                    <div class="progress-bar bg-info" role="progressbar" style="width: <%= percent %>%;">
                        <%= String.format("%.2f", percent) %>%
                    </div>
                </div>
            </div>
        <% } %>
    <% } %>

    <a href="userDashboard.jsp" class="btn btn-secondary mt-4">← Back to Dashboard</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
