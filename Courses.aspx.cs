using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAPPAssignment
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
        protected void btnAddCourse_Click(object sender, EventArgs e)
        {
            string title = txtCourseTitle.Text.Trim();
            string desc = txtCourseDesc.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            if (title == "" || desc == "")
            {
                lblCourseMessage.ForeColor = System.Drawing.Color.Red;
                lblCourseMessage.Text = "Please fill all fields.";
                return;
            }
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Courses (Title, Description, CreatedByUserID) VALUES (@Title, @Desc, 1)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", desc);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblCourseMessage.ForeColor = System.Drawing.Color.Green;
            lblCourseMessage.Text = "Course added successfully!";

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
            string desc = ((System.Web.UI.WebControls.TextBox)gvCourses.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "UPDATE Courses SET Title=@Title, Description=@Desc WHERE CourseID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", desc);
                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvCourses.EditIndex = -1;
            LoadCourses();
        }

        protected void gvCourses_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);

            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Courses WHERE CourseID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadCourses();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT CourseID, Title, Description FROM Courses";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvCourses.DataSource = dt;
                gvCourses.DataBind();
            }
        }
    }
}