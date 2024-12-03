using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace StudentManagementSystem
{
    public partial class ManageStudents : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StudentID, FullName, RollNumber, Email, Class, DateOfEnrollment FROM Students";
                SqlCommand cmd = new SqlCommand(query, conn);
                try
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    StudentsGridView.DataSource = dt;
                    StudentsGridView.DataBind();
                }
                catch (Exception ex)
                {
                    ErrorLabel.Text = "Error loading students: " + ex.Message;
                }
            }
        }

        protected void AddStudentButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Students (FullName, RollNumber, Email, Class, Password, DateOfEnrollment) VALUES (@FullName, @RollNumber, @Email, @Class, @Password, @DateOfEnrollment)";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@FullName", FullNameTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@RollNumber", RollNumberTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Class", ClassTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text.Trim());
                cmd.Parameters.AddWithValue("@DateOfEnrollment", DateTime.Now);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    LoadStudents();
                    ClearInputs();
                }
                catch (Exception ex)
                {
                    ErrorLabel.Text = "Error adding student: " + ex.Message;
                }
            }
        }

        private void ClearInputs()
        {
            FullNameTextBox.Text = string.Empty;
            RollNumberTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
            ClassTextBox.Text = string.Empty;
            PasswordTextBox.Text = string.Empty;
        }

        protected void StudentsGridView_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int studentId = Convert.ToInt32(StudentsGridView.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Students WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentId);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    LoadStudents();
                }
                catch (Exception ex)
                {
                    ErrorLabel.Text = "Error deleting student: " + ex.Message;
                }
            }
        }

        protected void StudentsGridView_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            StudentsGridView.EditIndex = e.NewEditIndex;
            LoadStudents();
        }

        protected void StudentsGridView_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            StudentsGridView.EditIndex = -1;
            LoadStudents();
        }
        
        protected void StudentsGridView_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int studentId = Convert.ToInt32(StudentsGridView.DataKeys[e.RowIndex].Value);
            string fullName = ((TextBox)StudentsGridView.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string rollNumber = ((TextBox)StudentsGridView.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string email = ((TextBox)StudentsGridView.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string classInfo = ((TextBox)StudentsGridView.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Students SET FullName = @FullName, RollNumber = @RollNumber, Email = @Email, Class = @Class WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@StudentID", studentId);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@RollNumber", rollNumber);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Class", classInfo);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    StudentsGridView.EditIndex = -1;
                    LoadStudents();
                }
                catch (Exception ex)
                {
                    ErrorLabel.Text = "Error updating student: " + ex.Message;
                }
            }
        }

    }

}
