<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="StudentManagementSystem.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        /* Resetting body styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to bottom right, #4facfe, #00f2fe);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Center container */
        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
            width: 80%;
            max-width: 900px;
        }

        /* Left section */
        .left-section {
            background: #007bff;
            color: white;
            padding: 30px;
            text-align: center;
            flex: 1;
        }

        .left-section .title {
            font-size: 2.5rem;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .left-section p {
            font-size: 1rem;
            line-height: 1.6;
        }

        /* Right section */
        .right-section {
            padding: 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .right-section .buttons {
            width: 100%;
            text-align: center;
        }

        .right-section a {
            display: inline-block;
            width: 80%;
            margin: 10px 0;
            padding: 15px;
            font-size: 1.2rem;
            color: white;
            text-decoration: none;
            background: #007bff;
            border-radius: 8px;
            transition: all 0.3s ease;
            text-align: center;
        }

        .right-section a:hover {
            background: #0056b3;
        }

        .right-section a:active {
            background: #004085;
        }

        /* Add responsiveness */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            .left-section, .right-section {
                flex: unset;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Section -->
        <div class="left-section">
            <div class="title">Welcome to SMS</div>
            <p>Manage student details and courses seamlessly with our Student Management System. 
               Click on the appropriate login or registration button to get started!</p>
        </div>

        <!-- Right Section -->
        <div class="right-section">
            <div class="buttons">
                <a href="AdminLogin.aspx"><i class="fas fa-user-shield"></i> Admin Login</a>
                <a href="StudentLogin.aspx"><i class="fas fa-user-graduate"></i> User Login</a>
                <a href="StudentRegistration.aspx"><i class="fas fa-user-plus"></i> Registration</a>
            </div>
        </div>
    </div>
</body>
</html>
