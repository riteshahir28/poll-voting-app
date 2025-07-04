<%@ page import="java.util.*, com.pollapp.model.poll,com.pollapp.dao.connection , com.pollapp.dao.PollDAO, com.pollapp.model.Users, com.pollapp.dao.UsersDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Users loggedInUser = (Users) session.getAttribute("role");
    if (loggedInUser == null || !"admin".equals(loggedInUser.getRole())) {
        response.sendRedirect("Login.jsp");
        return;
    }

    connection con = new connection();
    PollDAO pollDAO = new PollDAO(con.getConnection());
    List<poll> polls = pollDAO.getAllPolls();

    UsersDao userDAO = new UsersDao(con.getConnection());
    List<Users> users = userDAO.getAllUsers();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f7fa;
        }
        .card {
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .card-header {
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="Admin-navbar.jsp" />

<div class="container mt-4">
    <h2 class="mb-4">Admin Dashboard</h2>
    <a href="create-poll.jsp" class="btn btn-success mb-4">+ Create New Poll</a>

    <div class="row g-4">
        <!-- Poll Management Column -->
        <div class="col-md-7">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    Poll Management
                </div>
                <div class="card-body p-0">
                    <table class="table table-bordered mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>#</th>
                                <th>Question</th>
                                <th>Closing Time</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int sn = 1;
                                for (poll Poll : polls) {
                            %>
                            <tr>
                                <td><%= sn++ %></td>
                                <td><%= Poll.getQuestion() %></td>
                                <td><%= Poll.getClosingTime() %></td>
                                <td><%= Poll.getStatus() %></td>
                                <td>
                                    <% if(Poll.getStatus().equals("open")) { %>
                                        <a href="closepoll?pollId=<%=Poll.getId()%>" class="btn btn-warning btn-sm">Close</a>
                                        <a href="edit-poll.jsp?pollId=<%=Poll.getId()%>" class="btn btn-primary btn-sm">Edit</a>
                                        <a href="deletepoll?pollId=<%=Poll.getId()%>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                                    <% } else { %>
                                        <span class="text-muted">Poll Closed</span>
                                    <% } %>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Registered Users Column -->
        <div class="col-md-5">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    Registered Users
                </div>
                <div class="card-body p-0">
                    <table class="table table-striped mb-0">
                        <thead class="table-light">
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int i = 1;
                                for (Users u : users) {
                            %>
                            <tr>
                                <td><%= i++ %></td>
                                <td><%= u.getName() %></td>
                                <td><%= u.getEmail() %></td>
                                <td><%= u.getRole() %></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div> <!-- row end -->
</div> <!-- container end -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
