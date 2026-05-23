using System;

namespace WAPPAssignment
{
    public partial class QuizResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int score = 0, total = 3;
            if (Request.QueryString["score"] != null)
                int.TryParse(Request.QueryString["score"], out score);
            if (Request.QueryString["total"] != null)
                int.TryParse(Request.QueryString["total"], out total);

            if (score < 0 || score > total) score = 0;

            lblScore.Text = "Your Score: " + score + " / " + total;

            if (score >= 2)
            {
                lblStatus.Text = "PASSED ✓";
                lblStatus.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblStatus.Text = "FAILED ✗";
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }

            lblSaveNote.Text = Session["UserID"] != null
                ? "Your score has been saved to your profile."
                : "Log in to save your scores and track your progress.";
        }
    }
}
