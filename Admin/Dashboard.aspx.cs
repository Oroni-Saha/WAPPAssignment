using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WAPPAssignment.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                lblAdminName.Text = Session["FullName"] != null ? Session["FullName"].ToString() : "Admin";
                LoadStats();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        private void LoadStats()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Role='Student'", con);
                lblUserCount.Text = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand("SELECT COUNT(*) FROM Courses WHERE Status='Published'", con);
                lblCourseCount.Text = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand("SELECT COUNT(*) FROM QuizAttempts", con);
                lblAttemptCount.Text = cmd.ExecuteScalar().ToString();
            }
        }
    }
}
