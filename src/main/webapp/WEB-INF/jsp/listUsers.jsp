<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*, java.util.ArrayList, java.util.List, com.stech.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Users</title>
</head>
<body>
<h2>All Users</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Password</th>
    </tr> 
    <% 
    List<User> userList = new ArrayList<>();
    try {
        // Define the file path for the 'details' file
                String filePath = File_Path;
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        String line;
        
        while ((line = reader.readLine()) != null) {
            // Assuming the file format is "name,password" per line
            String[] parts = line.split(",");
            if (parts.length == 2) {
                String name = parts[0].trim();
                String password = parts[1].trim();
                userList.add(new User(name, password));
            }
        }
        reader.close();
    } catch (IOException e) {
        e.printStackTrace();
    }

    if (userList != null && !userList.isEmpty()) {
        for(User user : userList) {
    %>
            <tr>
                <td><%= user.getName() %></td>
                <td><%= user.getPassword() %></td>
            </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="2">No users found.</td>
    </tr>
    <%
    }
    %>
</table>

<a href="/login">Back to Home page</a>

</body>
</html>
