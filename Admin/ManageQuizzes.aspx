<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>

<script runat="server">

    string connStr = ConfigurationManager.ConnectionStrings["CodeMasterConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
        {
            Response.Redirect("~/Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadCourses();
            LoadQuestions();
        }
    }

    private void LoadCourses()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT CourseID, Title FROM Courses";
            SqlCommand cmd = new SqlCommand(query, con);

            con.Open();

            ddlCourse.DataSource = cmd.ExecuteReader();
            ddlCourse.DataTextField = "Title";
            ddlCourse.DataValueField = "CourseID";
            ddlCourse.DataBind();

            ddlCourse.Items.Insert(0, new ListItem("-- Select Course --", ""));
        }
    }

    protected void btnSaveQuestion_Click(object sender, EventArgs e)
    {
        if (ddlCourse.SelectedValue == "" || txtQuestion.Text.Trim() == "" ||
            txtOptionA.Text.Trim() == "" || txtOptionB.Text.Trim() == "" ||
            txtOptionC.Text.Trim() == "" || txtOptionD.Text.Trim() == "" ||
            ddlCorrectAnswer.SelectedValue == "")
        {
            lblMessage.Text = "Please fill all fields.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            return;
        }

        int quizID = 0;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            string checkQuiz = "SELECT QuizID FROM Quizzes WHERE CourseID=@CourseID";

            SqlCommand checkCmd = new SqlCommand(checkQuiz, con);
            checkCmd.Parameters.AddWithValue("@CourseID", ddlCourse.SelectedValue);

            object result = checkCmd.ExecuteScalar();

            if (result != null)
            {
                quizID = Convert.ToInt32(result);
            }
            else
            {
                string insertQuiz = "INSERT INTO Quizzes (CourseID, PassingScore, DurationMinutes) OUTPUT INSERTED.QuizID VALUES (@CourseID, @PassingScore, @Duration)";

                SqlCommand quizCmd = new SqlCommand(insertQuiz, con);
                quizCmd.Parameters.AddWithValue("@CourseID", ddlCourse.SelectedValue);
                quizCmd.Parameters.AddWithValue("@PassingScore", txtPassingScore.Text.Trim());
                quizCmd.Parameters.AddWithValue("@Duration", txtDuration.Text.Trim());

                quizID = Convert.ToInt32(quizCmd.ExecuteScalar());
            }

            string insertQuestion = @"INSERT INTO Questions 
                (QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer, Points)
                VALUES 
                (@QuizID, @QuestionText, @OptionA, @OptionB, @OptionC, @OptionD, @CorrectAnswer, 1)";

            SqlCommand questionCmd = new SqlCommand(insertQuestion, con);

            questionCmd.Parameters.AddWithValue("@QuizID", quizID);
            questionCmd.Parameters.AddWithValue("@QuestionText", txtQuestion.Text.Trim());
            questionCmd.Parameters.AddWithValue("@OptionA", txtOptionA.Text.Trim());
            questionCmd.Parameters.AddWithValue("@OptionB", txtOptionB.Text.Trim());
            questionCmd.Parameters.AddWithValue("@OptionC", txtOptionC.Text.Trim());
            questionCmd.Parameters.AddWithValue("@OptionD", txtOptionD.Text.Trim());
            questionCmd.Parameters.AddWithValue("@CorrectAnswer", ddlCorrectAnswer.SelectedValue);

            questionCmd.ExecuteNonQuery();
        }

        lblMessage.Text = "Question saved successfully!";
        lblMessage.ForeColor = System.Drawing.Color.Green;

        txtQuestion.Text = "";
        txtOptionA.Text = "";
        txtOptionB.Text = "";
        txtOptionC.Text = "";
        txtOptionD.Text = "";
        ddlCorrectAnswer.SelectedIndex = 0;

        LoadQuestions();
    }

    private void LoadQuestions()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = @"SELECT 
                                q.QuestionID,
                                c.Title AS CourseTitle,
                                q.QuestionText,
                                q.CorrectAnswer,
                                q.Points
                            FROM Questions q
                            INNER JOIN Quizzes z ON q.QuizID = z.QuizID
                            INNER JOIN Courses c ON z.CourseID = c.CourseID";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();

            da.Fill(dt);

            gvQuestions.DataSource = dt;
            gvQuestions.DataBind();
        }
    }

    protected void gvQuestions_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvQuestions.DataKeys[e.RowIndex].Value);

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "DELETE FROM Questions WHERE QuestionID=@ID";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ID", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        LoadQuestions();
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
                <p>Create and manage quiz questions for programming courses.</p>

                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                <div class="section-box">
                    <h3>Quiz Creation</h3>

                    <div class="form-group">
                        <label>Course</label>
                        <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>Passing Score (%)</label>
                            <asp:TextBox ID="txtPassingScore" runat="server" CssClass="form-control" Text="70"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label>Duration (Minutes)</label>
                            <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" Text="20"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="section-box">
                    <h3>Add New Quiz Question</h3>

                    <div class="form-group">
                        <label>Question</label>
                        <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Option A</label>
                            <asp:TextBox ID="txtOptionA" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 form-group">
                            <label>Option B</label>
                            <asp:TextBox ID="txtOptionB" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 form-group">
                            <label>Option C</label>
                            <asp:TextBox ID="txtOptionC" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 form-group">
                            <label>Option D</label>
                            <asp:TextBox ID="txtOptionD" runat="server" CssClass="form-control"></asp:TextBox>
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
                    </div>

                    <asp:Button ID="btnSaveQuestion" runat="server" Text="Save Question"
                        CssClass="btn btn-success"
                        OnClick="btnSaveQuestion_Click" />

                    <a href="Dashboard.aspx" class="btn btn-default">Back to Admin Dashboard</a>
                </div>

                <div class="section-box">
                    <h3>Existing Quiz Questions</h3>

                    <asp:GridView ID="gvQuestions" runat="server"
                        CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="False"
                        DataKeyNames="QuestionID"
                        OnRowDeleting="gvQuestions_RowDeleting">

                        <Columns>
                            <asp:BoundField DataField="CourseTitle" HeaderText="Course" />
                            <asp:BoundField DataField="QuestionText" HeaderText="Question" />
                            <asp:BoundField DataField="CorrectAnswer" HeaderText="Correct Answer" />
                            <asp:BoundField DataField="Points" HeaderText="Points" />
                            <asp:CommandField ShowDeleteButton="true" />
                        </Columns>

                    </asp:GridView>

                    <a href="../Quiz.aspx" class="btn btn-warning">Preview Quiz</a>
                </div>

            </div>
        </div>

    </div>

</form>
</body>
</html>