using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAPPAssignment.Admin
{
    public partial class ManageQuizzes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            if (!IsPostBack) LoadQuestions();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

            // Map letter answer to actual option text
            string correct = "";
            switch (ddlCorrect.SelectedValue)
            {
                case "A": correct = txtA.Text.Trim(); break;
                case "B": correct = txtB.Text.Trim(); break;
                case "C": correct = txtC.Text.Trim(); break;
                case "D": correct = txtD.Text.Trim(); break;
            }

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Use QuizID=1 as the default quiz (HTML quiz)
                string query = "INSERT INTO Questions (QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer, Marks) " +
                               "VALUES (1, @Q, @A, @B, @C, @D, @Correct, 1)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Q", txtQuestion.Text.Trim());
                cmd.Parameters.AddWithValue("@A", txtA.Text.Trim());
                cmd.Parameters.AddWithValue("@B", txtB.Text.Trim());
                cmd.Parameters.AddWithValue("@C", txtC.Text.Trim());
                cmd.Parameters.AddWithValue("@D", txtD.Text.Trim());
                cmd.Parameters.AddWithValue("@Correct", correct);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Question saved successfully!";
            txtQuestion.Text = txtA.Text = txtB.Text = txtC.Text = txtD.Text = "";
            LoadQuestions();
        }

        protected void gvQuestions_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvQuestions.DataKeys[e.RowIndex].Value);
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Questions WHERE QuestionID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Question deleted.";
            LoadQuestions();
        }

        private void LoadQuestions()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT QuestionID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer FROM Questions", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvQuestions.DataSource = dt;
                gvQuestions.DataBind();
            }
        }
    }
}
