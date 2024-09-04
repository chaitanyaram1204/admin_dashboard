<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
    font-family: Arial, sans-serif;
    background-color: #e9ecef;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
}

.welcome-container {
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 40px;
    max-width: 600px;
    width: 90%;
    margin-bottom: 20px; /* Space between the welcome section and the links */
}

h1 {
    color: #343a40;
    margin-bottom: 20px;
    font-size: 36px;
    font-weight: 600;
}

a {
    color: #007bff;
    text-decoration: none;
    font-size: 16px; /* Increased font size for better readability */
    margin: 10px 0;
    display: block;
}

a:hover {
    text-decoration: underline;
}

.links {
    max-width: 600px;
    width: 90%;
    padding: 0 20px; /* Padding to avoid links touching the edges */
}

.links a {
    margin: 10px 0; /* Adjusted margin for better spacing */
}

    </style>
</head>
<body>
	<div class="welcome-container">
        <h1>Welcome, ${name}!</h1>
    <div class="links">
            <a href="new">New Registration</a>
            <a href="delete">Delete User</a>
            <a href="update">Update User</a>
            <a href="list">All Users</a>
            <a href="pagination">Pagination</a>
            <a href="search">Search User</a>
            <a href="sort">Sort Users</a>
            <a href="count">Total Users</a>
        	<a href="/login1">Back to Home page</a>
            <a href="/login">Logout</a>
    </div>
    </div>
</body>
</html>
