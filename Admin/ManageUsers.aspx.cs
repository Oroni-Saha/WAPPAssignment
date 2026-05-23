using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WAPPAssignment.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            if (!IsPostBack) LoadUsers();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }

        protected void gvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUser")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int userID = Convert.ToInt32(gvUsers.DataKeys[rowIndex].Value);

                string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("SELECT FullName, Email, Role, Status FROM Users WHERE UserID=@ID", con);
                    cmd.Parameters.AddWithValue("@ID", userID);
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        hfEditUserID.Value = userID.ToString();
                        txtEditName.Text = r["FullName"].ToString();
                        txtEditEmail.Text = r["Email"].ToString();
                        ddlEditRole.SelectedValue = r["Role"].ToString();
                        ddlEditStatus.SelectedValue = r["Status"].ToString();
                        pnlEdit.Visible = true;
                    }
                }
            }
        }

        protected void gvUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            // Prevent deleting yourself
            if (id == Convert.ToInt32(Session["UserID"]))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "You cannot delete your own account.";
                return;
            }
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Users WHERE UserID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = "User deleted.";
            LoadUsers();
        }

        protected void btnSaveEdit_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            int id = Convert.ToInt32(hfEditUserID.Value);
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "UPDATE Users SET FullName=@N, Email=@E, Role=@R, Status=@S WHERE UserID=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@N", txtEditName.Text.Trim());
                cmd.Parameters.AddWithValue("@E", txtEditEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@R", ddlEditRole.SelectedValue);
                cmd.Parameters.AddWithValue("@S", ddlEditStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            pnlEdit.Visible = false;
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "User updated successfully!";
            LoadUsers();
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            pnlEdit.Visible = false;
        }

        private void LoadUsers()
        {
            string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter(
                    "SELECT UserID, FullName, Email, Role, Status, DateRegistered FROM Users ORDER BY DateRegistered DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
        }
    }
}
