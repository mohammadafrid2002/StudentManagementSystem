using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace StudentManagementSystem
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

        // Method to hash passwords using SHA256
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password); // Convert password to bytes
                byte[] hash = sha256.ComputeHash(bytes);         // Compute the hash

                // Convert hash bytes to a hexadecimal string
                StringBuilder hashedPassword = new StringBuilder();
                foreach (byte b in hash)
                {
                    hashedPassword.Append(b.ToString("x2"));
                }
                return hashedPassword.ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loginError.Visible = false;
                rollNumberError.Visible = false;
                passwordError.Visible = false;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string RollNumber = rollNumber.Text.Trim();
            string Password = password.Text.Trim();

            rollNumberError.Visible = false;
            passwordError.Visible = false;
            loginError.Visible = false;

            bool isValid = ValidateLogin(RollNumber, Password);

            if (isValid)
            {
                rollNumber.Text = string.Empty;
                password.Text = string.Empty;
                Session["Rollnumber"] = RollNumber;
                Response.Redirect("StudentDashboard.aspx");
            }
            else
            {
                loginError.Visible = true;
            }
        }

        private bool ValidateLogin(string rollNumber, string password)
        {
            if (string.IsNullOrEmpty(rollNumber))
            {
                rollNumberError.Visible = true;
                return false;
            }

            if (string.IsNullOrEmpty(password))
            {
                passwordError.Visible = true;
                return false;
            }

            string query = "SELECT COUNT(*) FROM Students WHERE RollNumber = @RollNumber AND Password = @Password";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@RollNumber", rollNumber);
                cmd.Parameters.AddWithValue("@Password", HashPassword(password)); // Hash input password

                try
                {
                    conn.Open();
                    int result = (int)cmd.ExecuteScalar();
                    return result > 0;
                }
                catch (Exception ex)
                {
                    loginError.Visible = true;
                    return false;
                }
            }
        }
    }
}