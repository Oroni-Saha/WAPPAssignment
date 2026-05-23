using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WAPPAssignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT UserID, FullName, Role FROM Users WHERE Email=@Email AND PasswordHash=@Password AND Status='Active'";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["UserID"] = reader["UserID"].ToString();
                    Session["FullName"] = reader["FullName"].ToString();
                    Session["Role"] = reader["Role"].ToString();

                    if (reader["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("Admin/Dashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("CourseCatalog.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
        }
    }
}