using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAPPAssignment
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            lblWelcome.Text = "Welcome back, " + Session["FullName"] + "! 👋";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                lblCourseCount.Text = GetSingleValue(con, "SELECT COUNT(*) FROM Courses").ToString();

                lblStudentCount.Text = GetSingleValue(con, "SELECT COUNT(*) FROM Users WHERE Role='Student'").ToString();

                lblQuizCount.Text = GetSingleValue(con,
                    "SELECT COUNT(*) FROM QuizAttempts WHERE UserID=@UserID", userID).ToString();

                object avgScoreObj = GetSingleValue(con,
                    "SELECT ISNULL(AVG(CAST(Score AS FLOAT) / NULLIF(TotalQuestions, 0) * 100), 0) FROM QuizAttempts WHERE UserID=@UserID", userID);

                int avgScore = Convert.ToInt32(Convert.ToDouble(avgScoreObj));
                lblAvgScore.Text = avgScore + "%";

                int totalModules = GetSingleInt(con, "SELECT COUNT(*) FROM Modules");
                int completedModules = GetSingleInt(con,
                    "SELECT COUNT(*) FROM QuizAttempts WHERE UserID=@UserID", userID);

                if (completedModules > totalModules)
                {
                    completedModules = totalModules;
                }

                lblTotalModules.Text = totalModules.ToString();
                lblModulesCompleted.Text = completedModules.ToString();

                int progressPercent = 0;

                if (totalModules > 0)
                {
                    progressPercent = (completedModules * 100) / totalModules;
                }

                lblProgressPercent.Text = progressPercent + "%";
                progressBar.Style["width"] = progressPercent + "%";

                LoadRecentQuizzes(con, userID);
            }
        }

        private object GetSingleValue(SqlConnection con, string query, int? userID = null)
        {
            SqlCommand cmd = new SqlCommand(query, con);

            if (userID != null)
            {
                cmd.Parameters.AddWithValue("@UserID", userID.Value);
            }

            return cmd.ExecuteScalar();
        }

        private int GetSingleInt(SqlConnection con, string query, int? userID = null)
        {
            object result = GetSingleValue(con, query, userID);

            if (result == null || result == DBNull.Value)
            {
                return 0;
            }

            return Convert.ToInt32(result);
        }

        private void LoadRecentQuizzes(SqlConnection con, int userID)
        {
            string query = @"
                SELECT TOP 5 AttemptDate, Score, TotalQuestions
                FROM QuizAttempts
                WHERE UserID=@UserID
                ORDER BY AttemptDate DESC";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserID", userID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            da.Fill(dt);

            gvRecentQuizzes.DataSource = dt;
            gvRecentQuizzes.DataBind();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}