using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace StudentManagementSystem
{
    public partial class AdminLogin : Page
    {
        // Get the connection string from web.config
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any logic when the page loads (if needed)
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string Username = UsernameTextBox.Text.Trim();  // TextBox for username
            string Password = PasswordTextBox.Text.Trim();  // TextBox for password

            // Reset any visible error messages on every login attempt
            UsernameErrorLabel.Visible = false;
            PasswordErrorLabel.Visible = false;
            LoginErrorLabel.Visible = false;

            bool isValid = ValidateLogin(Username, Password);

            if (isValid)
            {
                // Redirect to Admin Dashboard after successful login
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                // Show error message if login fails
                LoginErrorLabel.Visible = true;
            }
        }

        private bool ValidateLogin(string username, string password)
        {
            // Check if username and password are not empty
            if (string.IsNullOrEmpty(username))
            {
                UsernameErrorLabel.Visible = true;
                return false;
            }

            if (string.IsNullOrEmpty(password))
            {
                PasswordErrorLabel.Visible = true;
                return false;
            }

            // SQL query to check admin credentials
            string query = "SELECT COUNT(*) FROM Admin WHERE Username = @Username AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password); // Ensure password is hashed in production

                try
                {
                    conn.Open();
                    int result = (int)cmd.ExecuteScalar();
                    return result > 0;
                }
                catch (Exception ex)
                {
                    // Log exception details in a real-world scenario
                    LoginErrorLabel.Text = "An error occurred while processing your request. Please try again.";
                    LoginErrorLabel.Visible = true;
                    return false;
                }
            }
        }
    }
}
