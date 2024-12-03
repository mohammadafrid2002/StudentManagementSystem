<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="StudentManagementSystem.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            width: 350px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #007bff;
        }
        .input-field {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .login-btn:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            margin-top: 10px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form id="adminLoginForm" runat="server">
            <!-- Username Input -->
            <asp:TextBox ID="UsernameTextBox" runat="server" CssClass="input-field" placeholder="Enter Username" required="required" />
            <asp:Label ID="UsernameErrorLabel" runat="server" CssClass="error-message" Text="Username is required." Visible="true"></asp:Label>

            <!-- Password Input -->
            <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" CssClass="input-field" placeholder="Enter Password" required="required" />
            <asp:Label ID="PasswordErrorLabel" runat="server" CssClass="error-message" Text="Password is required!!" Visible="true"></asp:Label>

            <!-- Login Button -->
            <asp:Button ID="LoginButton" runat="server" CssClass="login-btn" Text="Login" OnClick="LoginButton_Click" />

            <!-- General Error Message -->
            <asp:Label ID="LoginErrorLabel" runat="server" CssClass="error-message" Text="Invalid username or password." Visible="false"></asp:Label>
        </form>
    </div>
</body>
</html>
