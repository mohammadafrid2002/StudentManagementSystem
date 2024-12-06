using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace StudentManagementSystem
{
    public partial class ManageCourses : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        // Load Courses into GridView
        private void LoadCourses()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Courses";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                CoursesGridView.DataSource = dt;
                CoursesGridView.DataBind();
            }
        }

        // Add Course
        protected void AddCourseButton_Click(object sender, EventArgs e)
        {
            string courseName = CourseNameTextBox.Text.Trim();
            string courseCode = CourseCodeTextBox.Text.Trim();
            string description = DescriptionTextBox.Text.Trim();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Courses (CourseName, CourseCode, Description, CreatedDate) VALUES (@CourseName, @CourseCode, @Description, @CreatedDate)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseName", courseName);
                cmd.Parameters.AddWithValue("@CourseCode", courseCode);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // Refresh the GridView
            LoadCourses();
        }

        // Edit Course
        protected void CoursesGridView_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            CoursesGridView.EditIndex = e.NewEditIndex;
            LoadCourses();
        }

        // Update Course
        protected void CoursesGridView_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int courseId = Convert.ToInt32(CoursesGridView.DataKeys[e.RowIndex].Value);
            string courseName = ((TextBox)CoursesGridView.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string courseCode = ((TextBox)CoursesGridView.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string description = ((TextBox)CoursesGridView.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Courses SET CourseName = @CourseName, CourseCode = @CourseCode, Description = @Description WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseName", courseName);
                cmd.Parameters.AddWithValue("@CourseCode", courseCode);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            CoursesGridView.EditIndex = -1;
            LoadCourses();
        }

        // Cancel Edit
        protected void CoursesGridView_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            CoursesGridView.EditIndex = -1;
            LoadCourses();
        }

        // Delete Course
        protected void CoursesGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int courseId = Convert.ToInt32(CoursesGridView.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Check if the course has dependent records
                string checkQuery = "SELECT COUNT(*) FROM StudentCourses WHERE CourseID = @CourseID";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@CourseID", courseId);

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    // Prevent deletion and notify the user
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Cannot delete the course as it has associated students.');", true);
                }
                else
                {
                    // Proceed with deletion
                    string deleteQuery = "DELETE FROM Courses WHERE CourseID = @CourseID";
                    SqlCommand deleteCmd = new SqlCommand(deleteQuery, conn);
                    deleteCmd.Parameters.AddWithValue("@CourseID", courseId);
                    deleteCmd.ExecuteNonQuery();

                    LoadCourses();
                }
            }
        }

    }
}

