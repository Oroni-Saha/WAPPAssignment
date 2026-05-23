<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Admin protection
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadCourses();
        }
    }

    // ADD COURSE
    protected void btnAddCourse_Click(object sender, EventArgs e)
    {
        if (txtCourseTitle.Text.Trim() == "" || txtDescription.Text.Trim() == "")
        {
            lblMessage.Text = "Please fill all fields.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "INSERT INTO Courses (Title, Description, CreatedByUserID) VALUES (@Title, @Description, @UserID)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Title", txtCourseTitle.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        lblMessage.Text = "Course added successfully!";
        lblMessage.ForeColor = System.Drawing.Color.Green;

        txtCourseTitle.Text = "";
        txtDescription.Text = "";

        LoadCourses();
    }

    // LOAD COURSES
    private void LoadCourses()
    {
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

    // EDIT MODE
    protected void gvCourses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCourses.EditIndex = e.NewEditIndex;
        LoadCourses();
    }

    // CANCEL EDIT
    protected void gvCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCourses.EditIndex = -1;
        LoadCourses();
    }

    // UPDATE COURSE
    protected void gvCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);

        string title = ((TextBox)gvCourses.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

        string desc = ((TextBox)gvCourses.Rows[e.RowIndex].Cells[2].Controls[0]).Text;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "UPDATE Courses SET Title=@Title, Description=@Description WHERE CourseID=@ID";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Title", title);
            cmd.Parameters.AddWithValue("@Description", desc);
            cmd.Parameters.AddWithValue("@ID", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        gvCourses.EditIndex = -1;

        LoadCourses();
    }

    // DELETE COURSE
    protected void gvCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvCourses.DataKeys[e.RowIndex].Value);

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

</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Courses</title>

    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />

    <style>
        body {
            background: #f5f7fb;
            font-family: Arial;
        }

        .container-box {
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn {
            margin-top: 10px;
        }

        table {
            margin-top: 30px;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="container-box">

        <h2>Manage Courses</h2>

        <asp:Label ID="lblMessage" runat="server"></asp:Label>

        <hr />

        <h3>Add New Course</h3>

        <asp:TextBox ID="txtCourseTitle" runat="server"
            CssClass="form-control"
            placeholder="Course Title">
        </asp:TextBox>

        <asp:TextBox ID="txtDescription" runat="server"
            CssClass="form-control"
            TextMode="MultiLine"
            Rows="4"
            placeholder="Course Description">
        </asp:TextBox>

        <asp:Button ID="btnAddCourse"
            runat="server"
            Text="Add Course"
            CssClass="btn btn-primary"
            OnClick="btnAddCourse_Click" />

        <hr />

        <h3>Existing Courses</h3>

        <asp:GridView ID="gvCourses"
            runat="server"
            CssClass="table table-bordered table-striped"
            AutoGenerateColumns="False"
            DataKeyNames="CourseID"
            OnRowEditing="gvCourses_RowEditing"
            OnRowUpdating="gvCourses_RowUpdating"
            OnRowCancelingEdit="gvCourses_RowCancelingEdit"
            OnRowDeleting="gvCourses_RowDeleting">

            <Columns>

                <asp:BoundField DataField="CourseID"
                    HeaderText="ID"
                    ReadOnly="true" />

                <asp:BoundField DataField="Title"
                    HeaderText="Course Title" />

                <asp:BoundField DataField="Description"
                    HeaderText="Description" />

                <asp:CommandField
                    ShowEditButton="true"
                    ShowDeleteButton="true" />

            </Columns>

        </asp:GridView>

    </div>

</form>

</body>
</html>