<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudents.aspx.cs" Inherits="StudentManagementSystem.ManageStudents" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            margin: 20px;
        }
        .form-section {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 5px 0;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .gridview-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Students</h2>

            <!-- Add Student Section -->
            <div class="form-section">
                <label for="FullNameTextBox">Full Name:</label>
                <asp:TextBox ID="FullNameTextBox" runat="server" placeholder="Enter full name"></asp:TextBox>

                <label for="RollNumberTextBox">Roll Number:</label>
                <asp:TextBox ID="RollNumberTextBox" runat="server" placeholder="Enter roll number"></asp:TextBox>

                <label for="EmailTextBox">Email:</label>
                <asp:TextBox ID="EmailTextBox" runat="server" TextMode="Email" placeholder="Enter email"></asp:TextBox>

                <label for="ClassTextBox">Class:</label>
                <asp:TextBox ID="ClassTextBox" runat="server" placeholder="Enter class"></asp:TextBox>

                <label for="PasswordTextBox">Password:</label>
                <asp:TextBox ID="PasswordTextBox" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>

                <asp:Button ID="AddStudentButton" runat="server" Text="Add Student" OnClick="AddStudentButton_Click" />
                <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label>
            </div>

            <!-- Students List Section -->
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
        </div>
    </form>
</body>
</html>
