using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace StudentManagementSystem
{
    public partial class ViewReports : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudentsReport();
                LoadCoursesReport();
            }
        }

        private void LoadStudentsReport()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StudentID, FullName, RollNumber, Email, Class, DateOfEnrollment FROM Students";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                StudentsReportGridView.DataSource = dt;
                StudentsReportGridView.DataBind();
            }
        }

        private void LoadCoursesReport()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseID, CourseName, CourseCode, Description, CreatedDate FROM Courses";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                CoursesReportGridView.DataSource = dt;
                CoursesReportGridView.DataBind();
            }
        }
    }
}
