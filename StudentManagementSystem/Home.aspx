<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentManagementSystem.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        /* Basic CSS for layout */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .left-side {
            width: 40%;
            text-align: center;
        }

        .right-side {
            width: 40%;
            text-align: right;
        }

        .title {
            font-size: 36px;
            font-weight: bold;
            color: #007bff;
        }

        .login-buttons {
            margin-top: 20px;
        }

        .login-buttons a {
            display: block;
            margin: 10px 0;
            padding: 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .login-buttons a:hover {
            background-color: #0056b3;
        }

        .login-buttons a:active {
            background-color: #004085;
        }

    </style>
</head>
<body>

    <div class="container">
        <!-- Left Side -->
        <div class="left-side">
            <div class="login-buttons">
                <a href="AdminLogin.aspx">Admin Login</a>
                <a href="StudentLogin.aspx">User Login</a>
                <a href="StudentRegistration.aspx">Registration Login</a>
            </div>
        </div>

        <!-- Right Side -->
        <div class="right-side">
            <div class="title">Student Management System</div>
        </div>
    </div>

</body>
</html>
