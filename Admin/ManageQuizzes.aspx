<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isLoggedIn =
            Session["UserID"] != null ||
            Session["Username"] != null ||
            Session["AdminID"] != null ||
            Session["Email"] != null;

      //  if (!isLoggedIn)
        //{
          //  Response.Redirect("~/Login.aspx");
        //}
    }
</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Quizzes</title>
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
                <a href="ManageCourses.aspx">Course Management</a>
                <a href="ManageQuizzes.aspx" class="active">Quiz Management</a>
                <a href="../Quiz.aspx">Preview Quiz</a>
                <a href="../Default.aspx">Main Website</a>
            </div>

            <div class="main-content">
                <div class="page-card">
                    <h2>Manage Quizzes</h2>
                    <p>Create and manage assessment questions for programming courses.</p>

                    <div class="section-box">
                        <h3>Quiz Creation</h3>

                        <div class="form-group">
                            <label>Course</label>
                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select Course --" Value=""></asp:ListItem>
                                <asp:ListItem Text="HTML Fundamentals" Value="HTML"></asp:ListItem>
                                <asp:ListItem Text="CSS Basics" Value="CSS"></asp:ListItem>
                                <asp:ListItem Text="JavaScript Introduction" Value="JavaScript"></asp:ListItem>
                                <asp:ListItem Text="Python Programming" Value="Python"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCourse" runat="server"
                                ControlToValidate="ddlCourse"
                                InitialValue=""
                                ErrorMessage="Course is required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Passing Score (%)</label>
                                <asp:TextBox ID="txtPassingScore" runat="server" CssClass="form-control" Text="70"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassingScore" runat="server"
                                    ControlToValidate="txtPassingScore"
                                    ErrorMessage="Passing score is required."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revPassingScore" runat="server"
                                    ControlToValidate="txtPassingScore"
                                    ValidationExpression="^(100|[1-9]?[0-9])$"
                                    ErrorMessage="Enter a score from 0 to 100."
                                    ForeColor="Red">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="col-md-6">
                                <label>Duration (Minutes)</label>
                                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" Text="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDuration" runat="server"
                                    ControlToValidate="txtDuration"
                                    ErrorMessage="Duration is required."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revDuration" runat="server"
                                    ControlToValidate="txtDuration"
                                    ValidationExpression="^[1-9][0-9]*$"
                                    ErrorMessage="Duration must be a positive number."
                                    ForeColor="Red">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>

                    <div class="section-box">
                        <h3>Add New Quiz Question</h3>

                        <div class="form-group">
                            <label>Question</label>
                            <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvQuestion" runat="server"
                                ControlToValidate="txtQuestion"
                                ErrorMessage="Question is required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Option A</label>
                                <asp:TextBox ID="txtOptionA" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvOptionA" runat="server"
                                    ControlToValidate="txtOptionA"
                                    ErrorMessage="Option A is required."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Option B</label>
                                <asp:TextBox ID="txtOptionB" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvOptionB" runat="server"
                                    ControlToValidate="txtOptionB"
                                    ErrorMessage="Option B is required."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Option C</label>
                                <asp:TextBox ID="txtOptionC" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvOptionC" runat="server"
                                    ControlToValidate="txtOptionC"
                                    ErrorMessage="Option C is required."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-6 form-group">
                                <label>Option D</label>
                                <asp:TextBox ID="txtOptionD" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvOptionD" runat="server"
                                    ControlToValidate="txtOptionD"
                                    ErrorMessage="Option D is required."
                                    ForeColor="Red">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Correct Answer</label>
                            <asp:DropDownList ID="ddlCorrectAnswer" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select Correct Answer --" Value=""></asp:ListItem>
                                <asp:ListItem Text="Option A" Value="A"></asp:ListItem>
                                <asp:ListItem Text="Option B" Value="B"></asp:ListItem>
                                <asp:ListItem Text="Option C" Value="C"></asp:ListItem>
                                <asp:ListItem Text="Option D" Value="D"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCorrectAnswer" runat="server"
                                ControlToValidate="ddlCorrectAnswer"
                                InitialValue=""
                                ErrorMessage="Correct answer is required."
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <asp:Button ID="btnSaveQuestion" runat="server" Text="Save Question" CssClass="btn btn-success"
                            OnClientClick="return showPendingMessage('Save Question');" />

                        <a href="Dashboard.aspx" class="btn btn-default">Back to Admin Dashboard</a>
                    </div>

                    <div class="section-box">
                        <h3>Existing Quiz Questions</h3>

                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Course</th>
                                    <th>Question</th>
                                    <th>Correct Answer</th>
                                    <th>Points</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>HTML Fundamentals</td>
                                    <td>What does HTML stand for?</td>
                                    <td>Option A</td>
                                    <td>1</td>
                                    <td>
                                        <button type="button" class="btn btn-warning btn-sm" onclick="return showPendingMessage('Edit Question');">Edit</button>
                                        <button type="button" class="btn btn-danger btn-sm" onclick="return showPendingMessage('Delete Question');">Delete</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <a href="../Quiz.aspx" class="btn btn-warning">Preview Quiz</a>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>