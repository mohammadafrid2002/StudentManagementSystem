using System;
using System.Data.SqlClient;
using System.Configuration;

namespace StudentManagementSystem
{
    public partial class AdminEnroll : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
                LoadCourses();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StudentID, FullName FROM Students";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    ddlStudents.DataSource = cmd.ExecuteReader();
                    ddlStudents.DataTextField = "FullName";
                    ddlStudents.DataValueField = "StudentID";
                    ddlStudents.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading students: " + ex.Message;
                }
            }
        }

        private void LoadCourses()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseID, CourseName FROM Courses";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    ddlCourses.DataSource = cmd.ExecuteReader();
                    ddlCourses.DataTextField = "CourseName";
                    ddlCourses.DataValueField = "CourseID";
                    ddlCourses.DataBind();
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error loading courses: " + ex.Message;
                }
            }
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            int studentId = Convert.ToInt32(ddlStudents.SelectedValue);
            int courseId = Convert.ToInt32(ddlCourses.SelectedValue);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    IF NOT EXISTS (SELECT 1 FROM StudentCourses WHERE StudentID = @StudentID AND CourseID = @CourseID)
                    BEGIN
                        INSERT INTO StudentCourses (StudentID, CourseID, EnrollmentDate)
                        VALUES (@StudentID, @CourseID, GETDATE())
                    END";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentId);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                try
                {
                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    lblMessage.Text = rowsAffected > 0
                        ? "Student successfully enrolled!"
                        : "Student is already enrolled in this course.";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error enrolling student: " + ex.Message;
                }
            }
        }
    }
}
