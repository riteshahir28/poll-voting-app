<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8d7da;
        }
        .error-box {
            max-width: 600px;
            margin: 100px auto;
            padding: 30px;
            border: 1px solid #f5c6cb;
            border-radius: 10px;
            background-color: #fff;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="error-box text-center">
            <h2 class="text-danger">🚫 Access Denied!</h2>
            <p class="mt-3">You are not authorized to access this page or action.</p>
            <a href="Register.jsp" class="btn btn-danger mt-4">Go to Register</a>
        </div>
    </div>

</body>
</html>
