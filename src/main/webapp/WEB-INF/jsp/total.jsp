<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Count</title>
<link rel="stylesheet" href="styles.css"> <!-- Link to the CSS file -->
<style>
body {
    font-family: 'Roboto', sans-serif;
    background-color: #f8f9fa;
    color: #495057;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: #ffffff;
    padding: 40px 50px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 12px;
    text-align: center;
    max-width: 400px;
    width: 100%;
}

h1 {
    font-size: 2em;
    color: #343a40;
    margin-bottom: 20px;
}

.count {
    font-size: 1.5em;
    color: #007bff;
    font-weight: bold;
}

.count span {
    font-size: 2em;
    color: #343a40;
}</style>

</head>
<body>
    <div class="container">
        <h1>Total users Count</h1>
        <% 
            int currentPage = (int) request.getAttribute("count");
        %>
        <p class="count">Total users: <span><%= currentPage %></span></p>
    <a href="/login1">Back to Home page</a>
    </div>
</body>
</html>
