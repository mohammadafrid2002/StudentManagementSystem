<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RollNumber.aspx.cs" Inherits="StudentManagementSystem.RollNumber" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Roll Number Notification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .container {
            margin: 0 auto;
            max-width: 500px;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
        }
        .roll-number {
            font-size: 20px;
            font-weight: bold;
            color: #007BFF;
        }
        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Welcome to Student Portal</h1>
            <p>Your Roll Number:</p>
            <asp:Label ID="lblRollNumber" runat="server" CssClass="roll-number" Text=""></asp:Label>
            <br />
            <button type="button" onclick="promptLogin()">Login</button>
        </div>
    </form>
    <script>
        function promptLogin() {
            alert('Notice: Please note your Roll Number as it will be required for login.');
            // Redirect to login page
            window.location.href = 'StudentLogin.aspx';
        }
    </script>
</body>
</html>

