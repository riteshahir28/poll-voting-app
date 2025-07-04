<%@ page import="jakarta.servlet.http.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create New Poll</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
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
<jsp:include page="Admin-navbar.jsp" />

<div class="container mt-5">

    <h2 class="mb-4">Create New Poll</h2>

    <!-- ✅ Success/Error Alert -->
    <% if (request.getAttribute("success") != null) { %>
        <div class="alert alert-success custom-alert text-center" role="alert">
            <%= request.getAttribute("success") %>
        </div>
    <% } %>

    <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger custom-alert text-center" role="alert">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <form action="createpoll" method="post" class="bg-light p-4 rounded shadow">
        <div class="mb-3">
            <label for="question" class="form-label">Poll Question</label>
            <input type="text" class="form-control" id="question" name="question" placeholder="Enter your poll question here" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Options <span class="text-muted">(Minimum 2)</span></label>
            <div id="options-container">
                <input type="text" class="form-control mb-2" name="options" placeholder="Option 1" required>
                <input type="text" class="form-control mb-2" name="options" placeholder="Option 2" required>
            </div>
            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="addOption()">+ Add More Option</button>
        </div>

        <div class="mb-3">
            <label for="closingTime" class="form-label">Closing Date & Time</label>
            <input type="datetime-local" class="form-control" id="closingTime" name="closingTime" required>
        </div>

        <button type="submit" class="btn btn-success">Create Poll</button>
    </form>
</div>

<script>
    let optionCount = 2;

    function addOption() {
        optionCount++;
        const container = document.getElementById("options-container");
        const input = document.createElement("input");
        input.type = "text";
        input.className = "form-control mb-2";
        input.name = "options";
        input.placeholder = "Option " + optionCount;
        input.required = true;
        container.appendChild(input);
    }

    // Auto remove alerts after animation
    setTimeout(() => {
        document.querySelectorAll('.custom-alert').forEach(alert => {
            alert.remove();
        });
    }, 4000);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
