<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="StudentManagementSystem.StudentRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #00bcd4, #03a9f4);
            margin: 0;
            padding: 0;
            color: #fff;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #00bcd4;
            margin-bottom: 30px;
            font-size: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 16px;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #00bcd4;
            outline: none;
        }

        .form-group .error {
            color: #f44336;
            font-size: 12px;
        }

        .submit-btn, .back-home-btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background-color: #00bcd4;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover, .back-home-btn:hover {
            background-color: #0097a7;
        }

        .link {
            text-align: center;
            margin-top: 15px;
            color:black;

        }

        .link a {
            color: #00bcd4;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }

        .back-home-btn {
            margin-top: 15px;
            background-color: white;
            color: #00bcd4;
            border: 1px solid #00bcd4;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 20px;
            }

            .submit-btn, .back-home-btn {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Student Registration</h2>
            
            <div class="form-group">
                <label for="txtFullName">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter Full Name" />
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" InitialValue="" ErrorMessage="Name is required" ForeColor="Red" />
            </div>
            
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" InitialValue="" ErrorMessage="Email is required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Enter a valid email" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="txtClass">Class</label>
                <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter Class" />
                <asp:RequiredFieldValidator ID="revClass" runat="server" ControlToValidate="txtClass" InitialValue="" ErrorMessage="Class is required" ForeColor="Red" />
            </div>
            
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" InitialValue="" ErrorMessage="Password is required" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,20}$" ErrorMessage="Password must contain at least 1 uppercase, 1 lowercase, and 1 number, and be between 6 and 20 characters" ForeColor="Red" />
            </div>
          <!-- Confirm Password Field -->
            <div class="form-group">
                <label for="txtConfirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password" />
                <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" ForeColor="Red" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="submit-btn" OnClick="btnRegister_Click" />

            <div class="link">
                <p>Already have an account? <a href="StudentLogin.aspx">Login here</a></p>
            </div>

            <!-- Back to Home Button -->
            <button type="button" class="back-home-btn" onclick="window.location.href='Home.aspx'">Back to Home</button>
        </div>
    </form>
</body>
</html>
