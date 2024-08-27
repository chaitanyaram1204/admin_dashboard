<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Spring Boot Application</title>
    
</head>

<body>
    <div class="login-container">
        <h2>Login to Proceed</h2>
        <div class="error-message">${errorMessage}</div>
        <form method="post">
            <input type="text" name="name" placeholder="Username" required /><br>
            <input type="password" name="password" placeholder="Password" required /><br>
            <input type="submit" value="Login" />
        </form>
        <a href="new">New registration</a>
        <br/>
        <a href="delete">Delete User</a>
        <br/>
        <a href="list">All Users</a>
        <br/>
        <a href="update">Update User</a>
    </div>
</body>

</html>
