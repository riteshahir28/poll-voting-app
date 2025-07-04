<%@ page import="java.util.*, com.pollapp.model.*, com.pollapp.dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Users user = (Users) session.getAttribute("user");
    if (user == null || !"user".equals(user.getRole())) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String pollIdStr = request.getParameter("pollId");
    if (pollIdStr == null) {
        response.sendRedirect("userDashboard.jsp");
        return;
    }

    int pollId = Integer.parseInt(pollIdStr);
    connection con = new connection();
    PollDAO pollDAO = new PollDAO(con.getConnection());
    poll pollData = pollDAO.getPollById(pollId);
    List<Option> option = pollDAO.getOptionObjectsByPollId(pollId);

    VoteDAO voteDAO = new VoteDAO(con.getConnection());
    boolean hasVoted = voteDAO.hasUserVoted(user.getId(), pollId);

    session.removeAttribute("success");
    session.removeAttribute("error");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vote on Poll</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="User-navbar.jsp" />

<div class="container mt-5">

    <!-- ✅ Alert Box -->
    

    <h3>Poll: <%= pollData.getQuestion() %></h3>

    <% if (hasVoted) { %>
        <div class="alert alert-warning mt-3">You have already voted on this poll.</div>
        <a href="userDashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
    <% } else { %>
        <form action="vote" method="post" class="mt-4">
            <input type="hidden" name="pollId" value="<%= pollId %>">
            <% for (Option opt : option) { %>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="selectedOption" value="<%= opt.getId() %>" required>
                    <label class="form-check-label"><%= opt.getOptionText() %></label>
                </div>
            <% } %>
            <button type="submit" class="btn btn-primary mt-3">Submit Vote</button>
            <a href="userDashboard.jsp" class="btn btn-secondary mt-3">Cancel</a>
        </form>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
