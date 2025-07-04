<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Poll & Voting App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: linear-gradient(-45deg, #e3f2fd, #fff3e0, #fce4ec, #ede7f6);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            flex-direction: column;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .hero-section {
            padding: 100px 20px 60px 20px;
            text-align: center;
            flex: 1;
        }

        .hero-title {
            font-size: 2.8rem;
            font-weight: bold;
            color: #212529;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .hero-subtitle {
            font-size: 1.2rem;
            color: #555;
            margin-bottom: 30px;
            text-shadow: 1px 1px 1px rgba(0,0,0,0.05);
        }

        .btn-custom {
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 30px;
        }

        .footer {
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 -3px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
            text-align: center;
            color: #444;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Navbar (Optional) -->
<%@ include file="Navbar.jsp" %>

<div class="container hero-section">
    <h1 class="hero-title">Welcome to Poll & Voting App</h1>
    <p class="hero-subtitle">Participate in polls, express your opinion, and see what others think — all in one place!</p>
    
    <a href="Login.jsp" class="btn btn-primary btn-custom me-3">Login</a>
    <a href="Register.jsp" class="btn btn-outline-primary btn-custom">Register</a>
</div>

<!-- Footer -->
<div class="footer mt-auto">
     Poll & Voting App. created by Ritesh yadav All rights reserved.
</div>

</body>
</html>
