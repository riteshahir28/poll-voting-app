<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Poll & Voting App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.06);
        }

        .card-header {
            background-color: #d0ebff;
            color: #084c61;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #4dabf7;
            border-color: #4dabf7;
        }

        .btn-primary:hover {
            background-color: #339af0;
            border-color: #339af0;
        }

        .form-control:focus {
            border-color: #a5d8ff;
            box-shadow: 0 0 0 0.2rem rgba(77, 171, 247, 0.25);
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
                    <h4>Login</h4>
                </div>
                <div class="card-body">
                    <form action="login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" name="email" id="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger mt-3">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>
                </div>
                <div class="card-footer text-center bg-white">
                    <p class="mb-0">Don't have an account? <a href="Register.jsp">Register here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
