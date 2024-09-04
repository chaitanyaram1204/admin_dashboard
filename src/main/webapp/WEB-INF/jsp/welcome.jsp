<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
            display: flex;
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
        }

        h1 {
            color: #343a40;
            margin-bottom: 20px;
            font-size: 36px;
            font-weight: 600;
        }
    </style>
</head>

<body>
    <div class="welcome-container">
        <h1>Welcome, ${name}!</h1>
        <a href="/login1">Back to Home page</a>
    </div>
</body>

</html>
