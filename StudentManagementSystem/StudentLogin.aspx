<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="StudentManagementSystem.StudentLogin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #2196f3, #21cbf3);
            margin: 0;
            padding: 0;
            color: #333;
        }

        /* Container for login form */
        .login-container {
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        /* Header styling */
        .login-container h2 {
            text-align: center;
            color: #2196f3;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Label styling */
        label {
            font-size: 16px;
            color: #555;
        }


        /* Input fields styling */
        .form-control {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .form-control:focus {
            outline: none;
            border-color: #2196f3;
            box-shadow: 0 0 5px rgba(33, 150, 243, 0.5);
        }

        /* Button styling */
        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #2196f3;
            margin-top:10px;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #1976d2;
        }

        /* Back to Home Button styling */
        .back-home-btn {
            width: 100%;
            padding: 12px;
            background-color: #fff;
            color: #2196f3;
            font-size: 16px;
            border: 1px solid #2196f3;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 15px;
        }

        .back-home-btn:hover {
            background-color: #2196f3;
            color: white;
        }

        /* Error message styling */
        .error-message {
            color: red;
            font-size: 14px;
            display: none;
            text-align: center;
            margin-top: 10px;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .login-container {
                width: 90%;
                padding: 20px;
            }

            .btn-login, .back-home-btn {
                font-size: 14px;
            }
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

            <!-- Back to Home Button -->
            <button type="button" class="back-home-btn" onclick="window.location.href='Home.aspx'">Back to Home</button>
        </div>
    </form>
</body>
</html>
