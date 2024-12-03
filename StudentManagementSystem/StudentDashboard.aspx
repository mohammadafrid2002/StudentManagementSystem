<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="StudentManagementSystem.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard</title>
    <style>
        /* General styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 10px;
        }

        h1 {
            font-size: 30px;
        }

        /* Styling the student name label */
        .student-name {
            font-size: 20px;
            font-weight: 600;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            font-size: 16px;
        }

        th {
            background-color: #009688;
            color: white;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eaeaea;
        }

        .button {
            padding: 10px 20px;
            background-color: #009688;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #00796b;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            h1 {
                font-size: 24px;
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
            <asp:Label ID="lblStudentName" runat="server" CssClass="student-name" Text=""></asp:Label>

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
