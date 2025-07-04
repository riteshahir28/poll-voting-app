<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Poll & Voting App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f0f2f5;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.05);
        }

        .card-header {
            background: #e0f4e0;
            color: #2d6a4f;
            font-weight: 600;
        }

        .btn-success {
            background-color: #38b000;
            border-color: #38b000;
        }

        .btn-success:hover {
            background-color: #2d6a4f;
            border-color: #2d6a4f;
        }

        .form-control:focus, .form-select:focus {
            border-color: #95d5b2;
            box-shadow: 0 0 0 0.2rem rgba(56, 176, 0, 0.25);
        }

        .alert {
            border-radius: 8px;
            animation: fadeIn 0.4s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
<%@ include file="Navbar.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header text-center">
                    <h4>User Registration</h4>
                </div>
                <div class="card-body">
                    <form action="register" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="name" id="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="role" class="form-label">Role</label>
                            <select class="form-select" name="role" id="role" required>
                                <option value="user" selected>User</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Register</button>
                    </form>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger mt-3">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>
                    <% if (request.getAttribute("success") != null) { %>
                        <div class="alert alert-success mt-3">
                            <%= request.getAttribute("success") %>
                        </div>
                    <% } %>
                </div>
                <div class="card-footer text-center bg-white">
                    <p class="mb-0">Already have an account? <a href="Login.jsp">Login here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
