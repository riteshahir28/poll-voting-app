<%@ page import="com.pollapp.dao.*, com.pollapp.model.poll" %>
<%
    int pollId = Integer.parseInt(request.getParameter("pollId"));
    PollDAO dao = new PollDAO(new connection().getConnection());
    poll p = dao.getPollById(pollId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Poll</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Edit Poll</h2>
    <form action="editpoll" method="post">
        <input type="hidden" name="pollId" value="<%= p.getId() %>">

        <div class="mb-3">
            <label>Question</label>
            <input type="text" name="question" class="form-control" value="<%= p.getQuestion() %>" required>
        </div>

        <div class="mb-3">
            <label>Closing Time (YYYY-MM-DDTHH:MM:SS)</label>
            <input type="datetime-local" name="closingTime" class="form-control" 
                   value="<%= p.getClosingTime().toString().substring(0,16) %>" required>
        </div>

        <button type="submit" class="btn btn-primary">Update Poll</button>
    </form>
</div>
</body>
</html>
