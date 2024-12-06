using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            // Handle the download request
            if (Request.QueryString["download"] != null)
            {
                string reportType = Request.QueryString["download"];
                if (reportType == "students")
                {
                    ExportToCSV(StudentsReportGridView);
                }
                else if (reportType == "courses")
                {
                    ExportToCSV(CoursesReportGridView);
                }
            }
        }

        private void LoadStudentsReport()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                S.StudentID, 
                S.FullName, 
                S.RollNumber, 
                S.Email, 
                S.Class, 
                S.DateOfEnrollment,
                STRING_AGG(C.CourseName, ', ') AS CoursesJoined
            FROM 
                Students S
            LEFT JOIN 
                StudentCourses SC ON S.StudentID = SC.StudentID
            LEFT JOIN 
                Courses C ON SC.CourseID = C.CourseID
            GROUP BY 
                S.StudentID, S.FullName, S.RollNumber, S.Email, S.Class, S.DateOfEnrollment";

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

        // Method to export the GridView data to CSV
        private void ExportToCSV(GridView gridView)
        {
            StringBuilder sb = new StringBuilder();
            // Add header row to CSV
            foreach (TableCell cell in gridView.HeaderRow.Cells)
            {
                sb.Append(cell.Text + ",");
            }
            sb.Append("\n");

            // Add data rows to CSV
            foreach (GridViewRow row in gridView.Rows)
            {
                foreach (TableCell cell in row.Cells)
                {
                    sb.Append(cell.Text + ",");
                }
                sb.Append("\n");
            }

            // Send the CSV file as a download
            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", "attachment;filename=Report.csv");
            Response.Write(sb.ToString());
            Response.End();
        }
    }
}
