<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="StudentManagementSystem.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
    <style>
        /* General styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e3f2fd;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-left: 5px solid #1976d2;
        }

        h1, h2 {
            color: #1565c0;
            margin-bottom: 20px;
            font-weight: 600;
        }

        h1 {
            font-size: 28px;
        }

        h2 {
            font-size: 24px;
        }

        .student-name {
            font-size: 18px;
            font-weight: bold;
            color: #1976d2;
            margin-bottom: 20px;
        }

        /* Back to Home Button */
        .top-button-container {
            text-align: right;
            margin-bottom: 20px;
        }

        .button {
            padding: 10px 20px;
            background-color: #1976d2;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .button:hover {
            background-color: #0d47a1;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #1976d2;
            color: white;
            border-radius: 5px 5px 0 0;
        }

        td {
            background-color: #f5f5f5;
        }

        tr:hover {
            background-color: #e1f5fe;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h1, h2 {
                font-size: 20px;
            }

            table, th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Top Button (Right-Aligned) -->
            <div class="top-button-container">
                <a href="Home.aspx" class="button">Log Out</a>
            </div>

            <!-- Dashboard Content -->
            <h1>Student Dashboard</h1>
            <asp:Label ID="lblStudentName" runat="server" CssClass="student-name" Text="Welcome, [Student Name]!"></asp:Label>

            <h2>Your Enrolled Courses</h2>
            <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="False" GridLines="None" BorderWidth="0">
                <Columns>
                    <asp:BoundField DataField="CourseId" HeaderText="Course ID" />
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
