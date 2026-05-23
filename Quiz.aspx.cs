using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WAPPAssignment
{
    public partial class Quiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
                pnlLoginNotice.Visible = true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            int score = 0;
            if (q1.SelectedValue == "Hyper Text Markup Language") score++;
            if (q2.SelectedValue == "p") score++;
            if (q3.SelectedValue == "img") score++;

            // Save to DB only if logged in
            if (Session["UserID"] != null)
            {
                int userID = Convert.ToInt32(Session["UserID"]);
                string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO QuizAttempts (UserID, Score, TotalQuestions, AttemptDate) " +
                                   "VALUES (@UID, @Score, 3, GETDATE())";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UID", userID);
                    cmd.Parameters.AddWithValue("@Score", score);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("QuizResult.aspx?score=" + score + "&total=3");
        }
    }
}
