<%@ page import="java.util.*, com.pollapp.model.*, com.pollapp.dao.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Users user = (Users) session.getAttribute("user");
    if (user == null || !"user".equals(user.getRole())) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String successMsg = (String) session.getAttribute("success");
    String errorMsg = (String) session.getAttribute("error");
    session.removeAttribute("success");
    session.removeAttribute("error");

    connection con = new connection();
    PollDAO pollDAO = new PollDAO(con.getConnection());
    VoteDAO voteDAO = new VoteDAO(con.getConnection());

    List<poll> openPolls = pollDAO.getOpenPolls();
    List<poll> closedVotedPolls = voteDAO.getClosedPollsVotedByUser(user.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f5f7fa;
        }

        .custom-alert {
            animation: fadeIn 0.5s ease, fadeOut 0.5s ease 3.5s forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeOut {
            from { opacity: 1; transform: translateY(0); }
            to { opacity: 0; transform: translateY(-10px); }
        }
    </style>
</head>
<body>

<jsp:include page="User-navbar.jsp" />

<% if (successMsg != null) { %>
    <div class="alert alert-success alert-dismissible custom-alert position-fixed top-0 start-50 translate-middle-x mt-3 z-3 text-center w-50" role="alert">
        <%= successMsg %>
    </div>
<% } %>

<% if (errorMsg != null) { %>
    <div class="alert alert-danger alert-dismissible custom-alert position-fixed top-0 start-50 translate-middle-x mt-3 z-3 text-center w-50" role="alert">
        <%= errorMsg %>
    </div>
<% } %>

<div class="container mt-5">
    <div class="row g-4">
        <!-- Open Polls -->
        <div class="col-md-6">
            <div class="card h-100">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Open Polls</h5>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-hover">
                        <thead class="table-secondary">
                            <tr>
                                <th>#</th>
                                <th>Question</th>
                                <th>Closing Time</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            int sn = 1;
                            for (poll p : openPolls) {
                                boolean hasVoted = voteDAO.hasUserVoted(user.getId(), p.getId());
                        %>
                            <tr>
                                <td><%= sn++ %></td>
                                <td><%= p.getQuestion() %></td>
                                <td><%= p.getClosingTime() %></td>
                                <td>
                                    <% if (!hasVoted) { %>
                                        <a href="vote.jsp?pollId=<%=p.getId()%>" class="btn btn-success btn-sm">Vote Now</a>
                                    <% } else { %>
                                        <span class="badge bg-warning text-dark">Already Voted</span>
                                    <% } %>
                                </td>
                            </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Closed Polls -->
        <div class="col-md-6">
            <div class="card h-100">
                <div class="card-header bg-dark text-white">
                    <h5 class="mb-0">Closed Polls You Voted</h5>
                </div>
                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead class="table-secondary">
                            <tr>
                                <th>#</th>
                                <th>Question</th>
                                <th>Result</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            int i = 1;
                            for (poll cp : closedVotedPolls) {
                        %>
                            <tr>
                                <td><%= i++ %></td>
                                <td><%= cp.getQuestion() %></td>
                                <td><a href="vote_results.jsp?pollId=<%=cp.getId()%>" class="btn btn-info btn-sm">View Result</a></td>
                            </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Auto remove alerts after animation -->
<script>
    setTimeout(() => {
        document.querySelectorAll('.custom-alert').forEach(alert => {
            alert.remove();
        });
    }, 4000);
</script>

</body>
</html>
