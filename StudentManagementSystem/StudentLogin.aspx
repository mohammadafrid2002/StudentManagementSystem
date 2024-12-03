<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="StudentManagementSystem.StudentLogin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .login-container {
            width: 350px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-container h2 {
            text-align: center;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn-login {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            font-size: 12px;
            display: none;
        }
    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="login-container">
            <h2>Student Login</h2>
            <!-- Roll Number Input -->
            <label for="rollNumber">Roll Number:</label>
            <asp:TextBox ID="rollNumber" runat="server" CssClass="form-control" placeholder="Enter Roll Number" required="required" />
            <span id="rollNumberError" runat="server" class="error-message">Please enter your Roll Number.</span>
            
            <!-- Password Input -->
            <label for="password">Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password" required="required" />
            <span id="passwordError" runat="server" class="error-message">Please enter your password.</span>

            <!-- Login Button -->
            <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" CssClass="btn-login" />

            <!-- Error Message for Invalid Login -->
            <span id="loginError" runat="server" class="error-message">Invalid Roll Number or Password. Please try again.</span>
        </div>
    </form>
</body>
</html>
