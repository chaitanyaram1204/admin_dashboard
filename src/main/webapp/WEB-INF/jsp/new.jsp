<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>
<style>
    /* Your existing CSS styles here */
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
        padding: 30px;
        max-width: 290px;
        width: 100%;
        text-align: center;
        position: relative; /* Added to position the toggle password icon */
    }

    h2 {
        margin-bottom: 20px;
        color: #333333;
        font-size: 24px;
        font-weight: 600;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="text"],
    input[type="password"],
    input[type="file"] {
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
    input[type="password"]:focus,
    input[type="file"]:focus {
        border-color: #007bff;
        outline: none;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }

    p {
        margin-top: 20px;
    }

    .toggle-password {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        font-size: 16px;
        color: #007bff;
    }

    a {
        color: #007bff;
        text-decoration: none;
        font-size: 16px;
        font-weight: 600;
    }

    a:hover {
        text-decoration: underline;
    }

    .error-message {
        color: red;
        margin-bottom: 15px;
        font-size: 14px;
    }
</style>
<script>
    function togglePassword() {
        var passwordInput = document.querySelector('input[name="password"]');
        var toggleIcon = document.querySelector('.toggle-password');
        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            toggleIcon.textContent = "👁️"; // Eye icon
        } else {
            passwordInput.type = "password";
            toggleIcon.textContent = "🔒"; // Lock icon
        }
    }
</script>
</head>
<body>
    <div class="form-container">
        <h2>Add User</h2>
        <div class="error-message">${errorMessage}</div>
        <form method="post" action="/new" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Username" required />
            <div style="position: relative; width: 100%;">
                <input type="password" name="password" placeholder="Password" required minlength="8" maxlength="20" 
                pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}" title="Password must be between 8 to 20 characters long and include at least one number, one lowercase letter, and one uppercase letter." />
                <span class="toggle-password" onclick="togglePassword()"></span>
            </div>
            <input type="file" name="photo" />
            <input type="submit" value="Add" />
        </form>
        <p>
            <a href="/login1">Back to Home page</a>
        </p>
    </div>
</body>
</html>
