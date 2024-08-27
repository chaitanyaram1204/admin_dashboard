<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    
</head>
<body>
    <div class="update-container">
        <h1>Update User</h1>
        <form method="post" action="update" >
            <input type="text" name="name" placeholder="Username" required /><br>
            <input type="password" name="newPassword" placeholder="New Password" required />
            <br>
            <input type="submit" value="Update" />
        </form>
    </div>
</body>
</html>