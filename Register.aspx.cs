using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPPAssignment
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                // Check if email already exists
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email=@Email";

                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                con.Open();

                int exists = (int)checkCmd.ExecuteScalar();

                if (exists > 0)
                {
                    lblMessage.Text = "Email already exists!";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Insert new user
                string query = "INSERT INTO Users (FullName, Email, PasswordHash, Role, Status) VALUES (@Name, @Email, @Password, @Role, 'Active')";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", txtFullName.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Registration successful!";
                lblMessage.ForeColor = System.Drawing.Color.Lime;

                Response.Redirect("Login.aspx");
            }
        }
    }
}