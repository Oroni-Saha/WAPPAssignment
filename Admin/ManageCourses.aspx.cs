using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAPPAssignment.Admin
{
    public partial class ManageCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            if (!IsPostBack) LoadCourses();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            int adminID = Convert.ToInt32(Session["UserID"]);
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Courses (Title, Category, DifficultyLevel, Description, CreatedByUserID, Status) " +
                               "VALUES (@Title, @Cat, @Diff, @Desc, @AdminID, 'Published')";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", txtCourseTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Cat", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Diff", ddlDifficulty.SelectedValue);
                cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@AdminID", adminID);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Course added successfully!";
            txtCourseTitle.Text = "";
            txtDescription.Text = "";
            LoadCourses();
        }

        protected void gvCourses_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvCourses.EditIndex = e.NewEditIndex;
            LoadCourses();
        }

        protected void gvCourses_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvCourses.EditIndex = -1;
            LoadCourses();
        }

        protected void gvCourses_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);
            string title = ((System.Web.UI.WebControls.TextBox)gvCourses.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string cat = ((System.Web.UI.WebControls.TextBox)gvCourses.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string diff = ((System.Web.UI.WebControls.TextBox)gvCourses.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string status = ((System.Web.UI.WebControls.TextBox)gvCourses.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "UPDATE Courses SET Title=@T, Category=@C, DifficultyLevel=@D, Status=@S WHERE CourseID=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@T", title);
                cmd.Parameters.AddWithValue("@C", cat);
                cmd.Parameters.AddWithValue("@D", diff);
                cmd.Parameters.AddWithValue("@S", status);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            gvCourses.EditIndex = -1;
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Course updated successfully!";
            LoadCourses();
        }

        protected void gvCourses_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Courses WHERE CourseID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "Course deleted.";
            LoadCourses();
        }

        private void LoadCourses()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT CourseID, Title, Category, DifficultyLevel, Status FROM Courses ORDER BY DateCreated DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCourses.DataSource = dt;
                gvCourses.DataBind();
            }
        }
    }
}
