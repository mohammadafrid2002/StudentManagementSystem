using System;
using System.Web.UI;

namespace StudentManagementSystem
{
    public partial class RollNumber : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Ensure the roll number is available in the session
                if (Session["Rollnumber"] != null)
                {
                    // Display the roll number in the label
                    lblRollNumber.Text = Session["Rollnumber"].ToString();
                }
                else
                {
                    // Redirect to home/login page if session is empty
                    Response.Redirect("Home.aspx");
                }
            }
        }
    }
}
