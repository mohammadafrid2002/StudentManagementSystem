using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Ensure the student is logged in
                if (Session["Rollnumber"] != null)
                {
                    string rollNumber = Session["Rollnumber"].ToString();
                    int studentId = GetStudentIdByRollNumber(rollNumber); // Retrieve StudentID using RollNumber
                    LoadStudentDetails(studentId); // Use StudentID to load student details
                    LoadEnrolledCourses(studentId); // Use StudentID to load enrolled courses
                }
                else
                {
                    Response.Redirect("Home.aspx"); // Redirect to login page if session is empty
                }
            }
        }

        // Function to get the StudentID based on RollNumber
        private int GetStudentIdByRollNumber(string rollNumber)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StudentID FROM Students WHERE RollNumber = @RollNumber";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@RollNumber", rollNumber);

                conn.Open();
                object result = cmd.ExecuteScalar(); // Get the first column of the first row
                conn.Close();

                if (result != null)
                {
                    return Convert.ToInt32(result); // Convert to integer and return StudentID
                }
                else
                {
                    return 0; // Return 0 if no student found
                }
            }
        }

        // Load student details using StudentID
        private void LoadStudentDetails(int studentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT FullName,RollNumber FROM Students WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read()) // Check if data exists
                {
                    lblStudentName.Text = "Welcome, " + reader["FullName"].ToString() +" roll number "+ reader["RollNUmber"].ToString(); // Display student name
                }
                conn.Close();
            }
        }

        // Load enrolled courses for the student
        private void LoadEnrolledCourses(int studentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT c.CourseId, c.CourseName, c.Description, c.CourseCode, c.CreatedDate
                    FROM StudentCourses sc
                    INNER JOIN Courses c ON sc.CourseID = c.CourseID
                    WHERE sc.StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvCourses.DataSource = dt;
                gvCourses.DataBind(); // Bind the courses to the GridView
            }
        }
    }
}
