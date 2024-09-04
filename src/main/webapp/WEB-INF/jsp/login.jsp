<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Spring Boot Application</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 290px;
            width: 100%;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333333;
            font-size: 24px;
            font-weight: 600;
        }

        .error-message {
            color: #e74c3c;
            margin-bottom: 20px;
            font-size: 14px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #dddddd;
            border-radius: 8px;
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
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 15px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
            margin: 10px 0;
            display: block;
        }

        a:hover {
            text-decoration: underline;
        }

        .links {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div class="login-container">
        <h2>Login to Proceed</h2>
        <div class="error-message">${errorMessage}</div>
        <form method="post">
            <input type="text" name="name" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>
        <!-- <div class="links">
            <a href="new">New Registration</a>
            <a href="delete">Delete User</a>
             <a href="update">Update User</a>
            <a href="list">All Users</a>
            <a href="pagination">Pagination</a>
            <a href="search">Search User</a>
            <a href="sort">Sort Users</a>
            <a href = "count">Total Users</a>
           
            
        </div>-->
    </div>
</body>

</html>
