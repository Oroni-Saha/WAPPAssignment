using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAPPAssignment
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                string name = Session["FullName"] != null ? Session["FullName"].ToString() : "Student";
                lblWelcome.Text = "Welcome back, " + name + "! \U0001F44B";
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
                int userID = Convert.ToInt32(Session["UserID"]);

                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Courses WHERE Status='Published'", con);
                lblCourseCount.Text = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Role='Student'", con);
                lblStudentCount.Text = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand("SELECT COUNT(*) FROM QuizAttempts WHERE UserID=@UID", con);
                cmd.Parameters.AddWithValue("@UID", userID);
                lblQuizCount.Text = cmd.ExecuteScalar().ToString();

                cmd = new SqlCommand(
                    "SELECT ISNULL(AVG(CAST(Score AS FLOAT) / NULLIF(TotalQuestions,0) * 100), 0) FROM QuizAttempts WHERE UserID=@UID", con);
                cmd.Parameters.AddWithValue("@UID", userID);
                object avg = cmd.ExecuteScalar();
                lblAvgScore.Text = avg != null ? Math.Round(Convert.ToDouble(avg), 0) + "%" : "N/A";

                cmd = new SqlCommand(
                    "SELECT TOP 5 AttemptDate, Score, TotalQuestions FROM QuizAttempts WHERE UserID=@UID ORDER BY AttemptDate DESC", con);
                cmd.Parameters.AddWithValue("@UID", userID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvRecentQuizzes.DataSource = dt;
                gvRecentQuizzes.DataBind();
            }
        }
    }
}

}