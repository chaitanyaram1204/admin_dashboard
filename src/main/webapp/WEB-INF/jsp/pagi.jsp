<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.List, com.stech.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorted Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            max-width: 800px;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #007bff;
            color: #fff;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9ecef;
        }

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination a {
            color: #007bff;
            text-decoration: none;
            padding: 8px 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin: 0 2px;
            display: inline-block;
        }

        .pagination a:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .pagination a.disabled {
            color: #6c757d;
            cursor: not-allowed;
            border: 1px solid #ddd;
        }

        .pagination a.active {
            background-color: #007bff;
            color: #fff;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-size: 16px;
            display: inline-block;
            margin-top: 20px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>All Users</h2>
    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<User> users = (List<User>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (User user : users) {
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
        </tbody>
    </table>

    <div class="pagination">
        <% 
            int currentPage = (int) request.getAttribute("currentPage");
            int totalPages = (int) request.getAttribute("totalPages");

            if (currentPage > 1) {
        %>
            <a href="/pagination?page=<%= currentPage - 1 %>">Previous</a>
        <% 
            } else {
        %>
            <a class="disabled">Previous</a>
        <% 
            }

            for (int i = 1; i <= totalPages; i++) {
                if (i == currentPage) {
        %>
            <a class="active"><%= i %></a>
        <% 
                } else {
        %>
            <a href="/pagination?page=<%= i %>"><%= i %></a>
        <% 
                }
            }

            if (currentPage < totalPages) {
        %>
            <a href="/pagination?page=<%= currentPage + 1 %>">Next</a>
        <% 
            } else {
        %>
            <a class="disabled">Next</a>
        <% 
            }
        %>
    </div>

    <a href="/login1">Back to Home page</a>
</body>
</html>
