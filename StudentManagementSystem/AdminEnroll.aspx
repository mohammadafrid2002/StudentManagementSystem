<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminEnroll.aspx.cs" Inherits="StudentManagementSystem.AdminEnroll" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Enroll Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        label {
            font-size: 16px;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .back-button {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            text-decoration: none;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            font-size: 14px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Back to Admin Dashboard Button -->
            <a href="AdminDashboard.aspx" class="back-button">Back</a>

            <h2>Enroll Student in a Course</h2>

            <label for="ddlStudents">Select Student:</label>
            <asp:DropDownList ID="ddlStudents" runat="server" CssClass="form-control" />

            <label for="ddlCourses">Select Course:</label>
            <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-control" />

            <asp:Button ID="btnEnroll" runat="server" Text="Enroll" CssClass="btn" OnClick="btnEnroll_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
