<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="StudentManagementSystem.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Student Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        /* General Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            width: 400px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        .input-field {
            width: 90%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        .login-btn {
            width: 100%;
            padding: 12px;
            margin: 20px 0 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background: #0056b3;
        }

        .home-btn {
            display: inline-block;
            margin: 10px 0;
            padding: 10px 15px;
            background: #6c757d;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .home-btn:hover {
            background: #5a6268;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            display: none;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .login-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form id="adminLoginForm" runat="server">
            <!-- Username Input -->
            <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="input-field" placeholder="Enter Username" required="required" />
            <asp:Label ID="UsernameErrorLabel" runat="server" CssClass="error-message" Text="Username is required." Visible="false"></asp:Label>

            <!-- Password Input -->
            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="input-field" placeholder="Enter Password" required="required" />
            <asp:Label ID="PasswordErrorLabel" runat="server" CssClass="error-message" Text="Password is required." Visible="false"></asp:Label>

            <!-- Login Button -->
            <asp:Button ID="LoginButton" runat="server" CssClass="login-btn" Text="Login" OnClick="LoginButton_Click" />

            <!-- General Error Message -->
            <asp:Label ID="LoginErrorLabel" runat="server" CssClass="error-message" Text="Invalid username or password." Visible="false"></asp:Label>
        </form>

        <!-- Return to Home Page Button -->
        <a href="Home.aspx" class="home-btn"><i class="fas fa-home"></i> Return to Home Page</a>
    </div>
</body>
</html>
