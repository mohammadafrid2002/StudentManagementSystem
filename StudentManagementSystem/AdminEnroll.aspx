<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminEnroll.aspx.cs" Inherits="StudentManagementSystem.AdminEnroll" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Enroll Student</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Enroll Student in a Course</h2>
        <label for="ddlStudents">Select Student:</label>
        <asp:DropDownList ID="ddlStudents" runat="server" />
        <br /><br />
        <label for="ddlCourses">Select Course:</label>
        <asp:DropDownList ID="ddlCourses" runat="server" />
        <br /><br />
        <asp:Button ID="btnEnroll" runat="server" Text="Enroll" OnClick="btnEnroll_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
    </form>
</body>
</html>
