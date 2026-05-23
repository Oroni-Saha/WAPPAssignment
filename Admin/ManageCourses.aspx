<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageCourses.aspx.cs" Inherits="WAPPAssignment.Admin.ManageCourses" %>
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
        .btn { border-radius: 8px; margin-right: 5px; margin-bottom: 5px; }
        .table { width: 100%; }
        @media (max-width: 900px) { .admin-wrapper { flex-direction: column; margin: 20px; } .sidebar { width: auto; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-wrapper">
            <div class="sidebar">
                <h3>CodeMaster</h3>
                <a href="Dashboard.aspx">Dashboard</a>
                <a href="ManageCourses.aspx" class="active">Course Management</a>
                <a href="ManageQuizzes.aspx">Quiz Management</a>
                <a href="ManageUsers.aspx">Manage Users</a>
                <a href="../Default.aspx">Main Website</a>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"
                    Style="margin-top:20px;width:100%;background:#ef4444;border:none;color:white;padding:10px;border-radius:8px;cursor:pointer;" />
            </div>
            <div class="main-content">
                <div class="page-card">
                    <h2>Manage Courses</h2>
                    <asp:Label ID="lblMessage" runat="server" Style="display:block;margin-bottom:10px;font-weight:bold;"></asp:Label>

                    <!-- ADD COURSE FORM -->
                    <div class="section-box">
                        <h3>Add New Course</h3>
                        <div class="form-group">
                            <label>Course Title</label>
                            <asp:TextBox ID="txtCourseTitle" runat="server" CssClass="form-control" placeholder="e.g. HTML Fundamentals"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtCourseTitle"
                                ErrorMessage="Course title is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory"
                                InitialValue="" ErrorMessage="Category is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Difficulty</label>
                            <asp:DropDownList ID="ddlDifficulty" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Beginner" Value="Beginner"></asp:ListItem>
                                <asp:ListItem Text="Intermediate" Value="Intermediate"></asp:ListItem>
                                <asp:ListItem Text="Advanced" Value="Advanced"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ControlToValidate="txtDescription"
                                ErrorMessage="Description is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" CssClass="btn btn-primary" OnClick="btnAddCourse_Click" />
                    </div>

                    <!-- COURSES TABLE -->
                    <div class="section-box">
                        <h3>Existing Courses</h3>
                        <asp:GridView ID="gvCourses" runat="server" CssClass="table table-bordered table-striped"
                            AutoGenerateColumns="false" DataKeyNames="CourseID"
                            OnRowEditing="gvCourses_RowEditing"
                            OnRowUpdating="gvCourses_RowUpdating"
                            OnRowCancelingEdit="gvCourses_RowCancelingEdit"
                            OnRowDeleting="gvCourses_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="true" />
                                <asp:BoundField DataField="Title" HeaderText="Title" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:BoundField DataField="DifficultyLevel" HeaderText="Difficulty" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"
                                    EditText="Edit" DeleteText="Delete"
                                    ButtonType="Button" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>