<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Poll & Voting App</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
          <!-- if user is registered then show the logout ,if not registered then show register  -->
        <% 
          Object u = session.getAttribute("user"); 
          if (u != null) {
        %>
          <li class="nav-item">
            <a class="nav-link" href="Login.jsp">Login</a>
          </li>
        <% } else { %>
          <li class="nav-item">
           
             <a class="nav-link" href="/logout">Logout</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Register.jsp">Register</a>
          </li>
        <% } %>
      </ul>
    </div>
  </div>
</nav>
