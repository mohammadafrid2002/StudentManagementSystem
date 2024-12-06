<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudents.aspx.cs" Inherits="StudentManagementSystem.ManageStudents" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Students</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            margin: 40px auto;
            padding: 40px;
            background: #ffffff;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            max-width: 1200px;
            width: 90%;
        }

        h2 {
            text-align: center;
            color: #1E90FF;
            font-size: 2.5rem;
            margin-bottom: 30px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .back-button {
            background-color: #1E90FF;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #4682b4;
        }

        /* Search Bar Styling */
        .search-bar {
            display: flex;
            justify-content: flex-start;
            margin-bottom: 20px;
        }

        .search-bar input {
            width: 250px;
            padding: 8px 15px;
            border-radius: 25px;
            border: 2px solid #1E90FF;
            font-size: 14px;
            transition: border-color 0.3s ease;
            margin-right: 10px;
            outline: none;
        }

        .search-bar input:focus {
            border-color: #4682b4;
        }

        /* Search Button with Blue Color */
        .search-bar button {
            padding: 8px 16px;
            background-color: #1E90FF;
            color: white;
            font-size: 14px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #4682b4;
            transform: scale(1.05);
        }

        .search-bar button:focus {
            outline: none;
        }

        /* Gridview Container */
        .gridview-container {
            margin-top: 30px;
        }

        .error-label {
            color: #e74c3c;
            font-size: 14px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        table th {
            background-color: #1E90FF;
            color: white;
        }

        .table-actions button {
            padding: 6px 12px;
            background-color: #f39c12;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 5px;
        }

        .table-actions button:hover {
            background-color: #e67e22;
        }

        /* Hover effect for rows */
        tr:hover {
            background-color: #f2f2f2;
        }

        @media (max-width: 768px) {
            .search-bar {
                flex-direction: column;
            }

            .search-bar input, .search-bar button {
                width: 100%;
            }

            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Top Bar -->
            <div class="top-bar">
                <h2>Manage Students</h2>
                <a href="AdminDashboard.aspx" class="back-button">Back to Dashboard</a>
            </div>

            <!-- Search Bar -->
            <div class="search-bar">
                <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" Placeholder="Search by Roll Number or Name" />
                <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="SearchButton_Click" />
            </div>

            <!-- Students Grid -->
            <div class="gridview-container">
                <asp:GridView ID="StudentsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID"
                    OnRowDeleting="StudentsGridView_RowDeleting" OnRowEditing="StudentsGridView_RowEditing"
                    OnRowCancelingEdit="StudentsGridView_RowCancelingEdit" OnRowUpdating="StudentsGridView_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="StudentID" HeaderText="Student ID" ReadOnly="True" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Class" HeaderText="Class" />
                        <asp:BoundField DataField="DateOfEnrollment" HeaderText="Date of Enrollment" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Error Label -->
            <asp:Label ID="ErrorLabel" runat="server" CssClass="error-label"></asp:Label>
        </div>
    </form>
</body>
</html>
