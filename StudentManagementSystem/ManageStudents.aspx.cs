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

        private void LoadStudents(string searchQuery = "")
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StudentID, FullName, RollNumber, Email, Class, DateOfEnrollment FROM Students";

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " WHERE FullName LIKE @SearchQuery OR RollNumber LIKE @SearchQuery";
                }

                SqlCommand cmd = new SqlCommand(query, conn);

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                }

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

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            LoadStudents(SearchTextBox.Text.Trim());
        }

        protected void StudentsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
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

        protected void StudentsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            StudentsGridView.EditIndex = e.NewEditIndex;
            LoadStudents();
        }

        protected void StudentsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            StudentsGridView.EditIndex = -1;
            LoadStudents();
        }

        protected void StudentsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
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
