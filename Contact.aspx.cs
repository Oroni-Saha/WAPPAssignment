using System;
using System.Web.UI;

namespace WAPPAssignment
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Response.Write("<script>alert('Message sent successfully!');</script>");

                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
        }
    }
}