<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Search</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e9ecef;
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
            max-width: 500px;
            width: 100%;
        }

        h1 {
            font-size: 2.2em;
            color: #343a40;
            margin-bottom: 20px;
        }

        form {
            font-size: 1.1em;
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 12px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 1em;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .error {
            color: #dc3545;
            margin-bottom: 20px;
            font-size: 1.1em;
        }

        .result {
            margin-top: 20px;
            font-size: 1.2em;
            text-align: left;
        }

        .result img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .result span {
            font-weight: bold;
            color: #343a40;
        }

        .logout-link {
            display: inline-block;
            background-color: #28a745;
            color: #ffffff;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 8px;
            font-size: 1.1em;
            transition: background-color 0.3s, transform 0.2s;
        }

        .logout-link:hover {
            background-color: #218838;
            transform: scale(1.05);
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>User Search</h1>
        <div class="error">${errorMessage}</div>
        <form method="post" action="/search">
            Username: <br><input type="text" name="username" required /><br><br>
            <input type="submit" value="Search" />
        </form>
        
        <div class="result">
            <c:if test="${not empty result}">
                <img src="${pageContext.request.contextPath}/images/${result[2]}" alt="User Image" />
                <p>${result[2]}</p>
                <p>Username: <span>${result[0]}</span></p>
                <p>Password: <span>${result[1]}</span></p>
            </c:if>
        </div>
        
        <a class="logout-link" href="/login1">Back to Home page</a>
    </div>
</body>

</html>
