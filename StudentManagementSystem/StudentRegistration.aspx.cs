using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace StudentManagementSystem
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
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

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string studentClass = txtClass.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            DateTime dateOfEnrollment = DateTime.Now;

            string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                INSERT INTO Students (FullName, Class, RollNumber, Email, Password, DateOfEnrollment) 
                VALUES (@FullName, @Class, @RollNumber, @Email, @Password, @DateOfEnrollment);
                SELECT SCOPE_IDENTITY();";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Class", studentClass);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@RollNumber", "null");
                cmd.Parameters.AddWithValue("@Password", HashPassword(password)); // Store hashed password
                cmd.Parameters.AddWithValue("@DateOfEnrollment", dateOfEnrollment);

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    int studentId = Convert.ToInt32(result);

                    string rollNumber = "21Td0" + studentId.ToString();
                    Session["Rollnumber"] = rollNumber;

                    string updateQuery = "UPDATE Students SET RollNumber = @RollNumber WHERE StudentID = @StudentID";
                    SqlCommand cmdUpdate = new SqlCommand(updateQuery, conn);
                    cmdUpdate.Parameters.AddWithValue("@RollNumber", rollNumber);
                    cmdUpdate.Parameters.AddWithValue("@StudentID", studentId);

                    cmdUpdate.ExecuteNonQuery();
                    Response.Redirect("StudentDashboard.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}