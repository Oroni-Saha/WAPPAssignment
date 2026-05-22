<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isLoggedIn =
            Session["UserID"] != null ||
            Session["Username"] != null ||
            Session["AdminID"] != null ||
            Session["Email"] != null;

       //if (!isLoggedIn)
        //{
          //  Response.Redirect("~/Login.aspx");
        //}
    }
</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Courses</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />

    <style>
        body { background: #f5f7fb; font-family: Arial, sans-serif; }
        .admin-wrapper { max-width: 1150px; margin: 40px auto; display: flex; gap: 25px; }
        .sidebar { width: 230px; background: #1f2937; color: white; border-radius: 16px; padding: 25px; height: fit-content; }
        .sidebar h3 { margin-top: 0; margin-bottom: 25px; font-weight: bold; }
        .sidebar a { display: block; color: #d1d5db; padding: 12px; border-radius: 8px; text-decoration: none; margin-bottom: 8px; }
        .sidebar a:hover, .sidebar .active { background: #374151; color: white; }
        .main-content { flex: 1; }
        .page-card { background: white; border-radius: 16px; padding: 30px; box-shadow: 0 6px 18px rgba(0,0,0,0.08); }
        .section-box { background: #fbfdff; border: 1px solid #e5e7eb; border-radius: 14px; padding: 22px; margin-top: 25px; }
        .form-control { border-radius: 8px; }
        .btn { border-radius: 8px; margin-bottom: 5px; }
        table { background: white; }

        @media (max-width: 900px) {
            .admin-wrapper { flex-direction: column; margin: 20px; }
            .sidebar { width: auto; }
        }
    </style>

    <script>
        function showPendingMessage(actionName) {
            alert(actionName + " will be connected after database integration.");
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-wrapper">
            <div class="sidebar">
                <h3>CodeMaster</h3>
                <a href="Dashboard.aspx">Dashboard</a>
                <a href="ManageCourses.aspx" class="active">Course Management</a>
                <a href="ManageQuizzes.aspx">Quiz Management</a>
                <a href="../Quiz.aspx">Preview Quiz</a>
                <a href="../Default.aspx">Main Website</a>
            </div>

            <div class="main-content">
                <div class="page-card">
                    <h2>Manage Courses</h2>
                    <p>Create, view, and manage programming courses for CodeMaster Academy.</p>

                    <div class="section-box">
                        <h3>Add New Course</h3>

                        <div class="form-group">
                            <label>Course Title</label>
                            <asp:TextBox ID="txtCourseTitle" runat="server" CssClass="form-control" placeholder="Example: HTML Fundamentals"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCourseTitle" runat="server"
                                ControlToValidate="txtCourseTitle"
                                ErrorMessage="Course title is required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Category</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select Category --" Value=""></asp:ListItem>
                                <asp:ListItem Text="HTML" Value="HTML"></asp:ListItem>
                                <asp:ListItem Text="CSS" Value="CSS"></asp:ListItem>
                                <asp:ListItem Text="JavaScript" Value="JavaScript"></asp:ListItem>
                                <asp:ListItem Text="Python" Value="Python"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server"
                                ControlToValidate="ddlCategory"
                                InitialValue=""
                                ErrorMessage="Category is required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Description</label>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server"
                                ControlToValidate="txtDescription"
                                ErrorMessage="Description is required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label>Difficulty</label>
                            <asp:DropDownList ID="ddlDifficulty" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Beginner" Value="Beginner"></asp:ListItem>
                                <asp:ListItem Text="Intermediate" Value="Intermediate"></asp:ListItem>
                                <asp:ListItem Text="Advanced" Value="Advanced"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="btn btn-primary"
                            OnClientClick="return showPendingMessage('Add Course');" />
                        <a href="Dashboard.aspx" class="btn btn-default">Back to Admin Dashboard</a>
                    </div>

                    <div class="section-box">
                        <h3>Existing Courses</h3>

                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Course Title</th>
                                    <th>Category</th>
                                    <th>Difficulty</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>HTML Fundamentals</td>
                                    <td>HTML</td>
                                    <td>Beginner</td>
                                    <td><span class="label label-success">Published</span></td>
                                    <td>
                                        <button type="button" class="btn btn-warning btn-sm" onclick="return showPendingMessage('Edit Course');">Edit</button>
                                        <button type="button" class="btn btn-danger btn-sm" onclick="return showPendingMessage('Delete Course');">Delete</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>CSS Basics</td>
                                    <td>CSS</td>
                                    <td>Beginner</td>
                                    <td><span class="label label-success">Published</span></td>
                                    <td>
                                        <button type="button" class="btn btn-warning btn-sm" onclick="return showPendingMessage('Edit Course');">Edit</button>
                                        <button type="button" class="btn btn-danger btn-sm" onclick="return showPendingMessage('Delete Course');">Delete</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>JavaScript Introduction</td>
                                    <td>JavaScript</td>
                                    <td>Intermediate</td>
                                    <td><span class="label label-default">Draft</span></td>
                                    <td>
                                        <button type="button" class="btn btn-warning btn-sm" onclick="return showPendingMessage('Edit Course');">Edit</button>
                                        <button type="button" class="btn btn-danger btn-sm" onclick="return showPendingMessage('Delete Course');">Delete</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>