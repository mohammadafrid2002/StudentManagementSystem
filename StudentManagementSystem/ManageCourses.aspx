<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCourses.aspx.cs" Inherits="StudentManagementSystem.ManageCourses" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Courses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative; /* Position relative for the button inside */
        }
        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            padding: 10px 20px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px 0;
        }
        .btn-add {
            background-color: #007bff;
        }
        .btn-save {
            background-color: #28a745;
        }
        .btn-cancel {
            background-color: #dc3545;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Back to Admin Dashboard Button -->
            <a href="AdminDashboard.aspx" class="back-button">Back to Admin Dashboard</a>
            
            <h2>Manage Courses</h2>
            <!-- Add Course Form -->
            <h3>Add New Course</h3>
            <asp:TextBox ID="CourseNameTextBox" runat="server" CssClass="form-control" Placeholder="Course Name" />
            <asp:TextBox ID="CourseCodeTextBox" runat="server" CssClass="form-control" Placeholder="Course Code" />
            <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="form-control" Placeholder="Description" />
            <asp:Button ID="AddCourseButton" runat="server" Text="Add Course" CssClass="btn btn-add" OnClick="AddCourseButton_Click" />

            <!-- GridView for Courses -->
            <h3>Courses List</h3>
            <asp:GridView ID="CoursesGridView" runat="server" AutoGenerateColumns="False" OnRowEditing="CoursesGridView_RowEditing"
                OnRowUpdating="CoursesGridView_RowUpdating" OnRowCancelingEdit="CoursesGridView_RowCancelingEdit"
                OnRowDeleting="CoursesGridView_RowDeleting" DataKeyNames="CourseID">
                <Columns>
                    <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                    <asp:BoundField DataField="CourseCode" HeaderText="Course Code" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
