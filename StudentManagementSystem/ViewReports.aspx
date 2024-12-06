<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewReports.aspx.cs" Inherits="StudentManagementSystem.ViewReports" %>

<!DOCTYPE html>
<html>
<head>
    <title>Reports - Students and Courses</title>
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
            position: relative; /* For absolute positioning of the button */
        }
        .back-button {
            position: absolute;
            right: 20px;
            top: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
        }
        .back-button:hover {
            background-color: #0056b3;
        }
        .tab-container {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 20px;
        }
        .tab {
            padding: 10px 20px;
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            margin-right: 5px;
        }
        .tab.active {
            background: #0056b3;
        }
        .table-container {
            display: none;
        }
        .table-container.active {
            display: block;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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
        .download-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
        .download-button:hover {
            background-color: #218838;
        }
    </style>
    <script>
        function switchTab(tabId) {
            document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
            document.querySelectorAll('.table-container').forEach(container => container.classList.remove('active'));

            document.getElementById(tabId).classList.add('active');
            document.querySelector(`[data-tab="${tabId}"]`).classList.add('active');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Back to Admin Dashboard Button -->
            <button type="button" class="back-button" onclick="window.location.href='AdminDashboard.aspx'">Back to Admin Dashboard</button>

            <h2>Reports</h2>
            <div class="tab-container">
                <button type="button" class="tab active" onclick="switchTab('studentsTab')">Students Report</button>
                <button type="button" class="tab" onclick="switchTab('coursesTab')">Courses Report</button>
            </div>

            <!-- Students Report -->
            <div id="studentsTab" class="table-container active" data-tab="studentsTab">
                <asp:GridView ID="StudentsReportGridView" runat="server" AutoGenerateColumns="False" GridLines="Both" BorderStyle="Solid" BorderColor="#ddd">
                    <Columns>
                        <asp:BoundField DataField="StudentID" HeaderText="Student ID" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Class" HeaderText="Class" />
                        <asp:BoundField DataField="DateOfEnrollment" HeaderText="Date of Enrollment" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="CoursesJoined" HeaderText="Courses Joined" />
                    </Columns>
                </asp:GridView>
                <button type="button" class="download-button" onclick="window.location.href='ViewReports.aspx?download=students'">Download Students Report</button>
            </div>

            <!-- Courses Report -->
            <div id="coursesTab" class="table-container" data-tab="coursesTab">
                <asp:GridView ID="CoursesReportGridView" runat="server" AutoGenerateColumns="False" GridLines="Both" BorderStyle="Solid" BorderColor="#ddd">
                    <Columns>
                        <asp:BoundField DataField="CourseID" HeaderText="Course ID" />
                        <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                        <asp:BoundField DataField="CourseCode" HeaderText="Course Code" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:yyyy-MM-dd}" />
                    </Columns>
                </asp:GridView>
                <button type="button" class="download-button" onclick="window.location.href='ViewReports.aspx?download=courses'">Download Courses Report</button>
            </div>
        </div>
    </form>
</body>
</html>
