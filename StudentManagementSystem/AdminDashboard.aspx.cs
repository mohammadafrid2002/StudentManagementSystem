using System;
using System.Data.SqlClient;
using System.Configuration;

namespace StudentManagementSystem
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["StudentManagementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            // Fetch total students
            TotalStudentsLabel.Text = GetCountFromDatabase("SELECT COUNT(*) FROM Students").ToString();

            // Fetch total courses
            TotalCoursesLabel.Text = GetCountFromDatabase("SELECT COUNT(*) FROM Courses").ToString();
        }

        private int GetCountFromDatabase(string query)
        {
            int count = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                try
                {
                    conn.Open();
                    count = (int)cmd.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    // Handle the exception (e.g., log it)
                    Console.WriteLine(ex.Message);
                }
            }

            return count;
        }
    }
}
