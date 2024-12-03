<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="StudentManagementSystem.AdminDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .dashboard-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            color: #007bff;
        }
        .overview-cards {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .card {
            flex: 1;
            margin: 0 10px;
            background-color: #007bff;
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card h2 {
            margin: 10px 0;
        }
        .card p {
            font-size: 24px;
            font-weight: bold;
        }
        .links-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .link {
            margin: 0 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="header">
            <h1>Admin Dashboard</h1>
            <p>Welcome to the Student Management System</p>
        </div>

        <!-- Overview Section -->
        <div class="overview-cards">
            <!-- Total Students -->
            <div class="card">
                <h2>Total Students</h2>
                <p><asp:Label ID="TotalStudentsLabel" runat="server" Text="0"></asp:Label></p>
            </div>
            <!-- Total Courses -->
            <div class="card">
                <h2>Total Courses</h2>
                <p><asp:Label ID="TotalCoursesLabel" runat="server" Text="0"></asp:Label></p>
            </div>
        </div>

        <!-- Links Section -->
        <div class="links-container">
            <a class="link" href="ManageStudents.aspx">Manage Students</a>
            <a class="link" href="AdminEnroll.aspx">Enroll Coursse </a>
            <a class="link" href="ManageCourses.aspx">Manage Courses</a>
            <a class="link" href="ViewReports.aspx">View Reports</a>
        </div>
    </div>
</body>
</html>
