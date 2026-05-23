using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAPPAssignment
{
    public partial class CourseCatalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
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
                string query = @"
                    SELECT 
                        CourseID,
                        Title,
                        Description,
                        ISNULL(Category, 'General') AS Category,
                        ISNULL(DifficultyLevel, 'Beginner') AS DifficultyLevel
                    FROM Courses
                    ORDER BY CourseID DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();

                da.Fill(dt);

                lblCourseCount.Text = dt.Rows.Count.ToString();

                rptCourses.DataSource = dt;
                rptCourses.DataBind();
            }
        }
    }
}