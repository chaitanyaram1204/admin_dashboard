<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete User</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        max-width: 290px;
        width: 100%;
        text-align: center;
    }

    h1 {
        margin-bottom: 20px;
        color: #333333;
        font-size: 24px;
        font-weight: 600;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: stretch;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 16px;
        transition: border-color 0.3s;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #007bff;
        outline: none;
    }

    input[type="submit"] {
        background-color: #dc3545;
        color: #ffffff;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #c82333;
    }

    p {
        margin-top: 20px;
    }

    a {
        color: #007bff;
        text-decoration: none;
        font-size: 14px;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h1>Delete User</h1>
        <form action="delete" method="post" >
            Name: <input type="text" name="name" required/><br/>
            Password: <input type="password" name="password" required/><br/>
            <input type="submit" value="Delete User"/>
        </form>
        <p>
    <a href="/login1">Back to Home page</a>
        </p>
    </div>
</body>
</html>
