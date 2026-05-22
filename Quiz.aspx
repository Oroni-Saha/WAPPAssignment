<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>HTML Fundamentals Quiz</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />

    <style>
        body { background: #f5f7fb; font-family: Arial, sans-serif; }
        .quiz-card { max-width: 900px; margin: 45px auto; background: white; padding: 35px; border-radius: 18px; box-shadow: 0 6px 18px rgba(0,0,0,0.08); }
        .quiz-header { margin-bottom: 25px; }
        .quiz-header h2 { font-weight: 700; color: #1f2937; }
        .question-box { background: #fbfdff; border: 1px solid #e5e7eb; border-radius: 14px; padding: 22px; margin-bottom: 25px; }
        .question-box h4 { margin-bottom: 15px; font-weight: 600; color: #1f2937; }
        .question-box label { display: block; padding: 10px 14px; border-radius: 8px; margin-bottom: 8px; cursor: pointer; background: white; border: 1px solid #ddd; }
        .question-box label:hover { background: #eef5ff; border-color: #337ab7; }
        .quiz-actions { margin-top: 25px; }
        .btn { border-radius: 8px; margin-bottom: 5px; }

        @media (max-width: 900px) {
            .quiz-card { margin: 20px; padding: 22px; }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="quiz-card">
        <div class="quiz-header">
            <h2>HTML Fundamentals Quiz</h2>
            <p>Answer the questions below and submit your quiz.</p>

            <div class="progress" style="margin-top:20px;">
                <div class="progress-bar progress-bar-success" role="progressbar" style="width:100%;">
                    3 of 3 Questions
                </div>
            </div>
        </div>

        <div class="question-box">
            <h4>1. What does HTML stand for?</h4>
            <asp:RadioButtonList ID="q1" runat="server">
                <asp:ListItem Value="1">Hyper Text Markup Language</asp:ListItem>
                <asp:ListItem Value="0">High Tech Modern Language</asp:ListItem>
                <asp:ListItem Value="0">Home Tool Markup Language</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvQ1" runat="server"
                ControlToValidate="q1"
                ErrorMessage="Please answer question 1."
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="question-box">
            <h4>2. Which tag is used to create a paragraph?</h4>
            <asp:RadioButtonList ID="q2" runat="server">
                <asp:ListItem Value="0">&amp;lt;h1&amp;gt;</asp:ListItem>
                <asp:ListItem Value="1">&amp;lt;p&amp;gt;</asp:ListItem>
                <asp:ListItem Value="0">&amp;lt;div&amp;gt;</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvQ2" runat="server"
                ControlToValidate="q2"
                ErrorMessage="Please answer question 2."
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="question-box">
            <h4>3. Which tag is used to insert an image?</h4>
            <asp:RadioButtonList ID="q3" runat="server">
                <asp:ListItem Value="0">&amp;lt;link&amp;gt;</asp:ListItem>
                <asp:ListItem Value="0">&amp;lt;src&amp;gt;</asp:ListItem>
                <asp:ListItem Value="1">&amp;lt;img&amp;gt;</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvQ3" runat="server"
                ControlToValidate="q3"
                ErrorMessage="Please answer question 3."
                ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>

        <div class="quiz-actions">
    <asp:Button ID="btnSubmitQuiz" runat="server" Text="Submit Quiz"
        CssClass="btn btn-primary" OnClick="btnSubmitQuiz_Click" />

    <a href="Admin/Dashboard.aspx" class="btn btn-default">Back to Admin Dashboard</a>
    <a href="Courses.aspx" class="btn btn-default">Back to Courses</a>
    <a href="Default.aspx" class="btn btn-default">Back Home</a>
</div>

        <script runat="server">
            protected void btnSubmitQuiz_Click(object sender, EventArgs e)
            {
                if (!Page.IsValid)
                {
                    return;
                }

                int score = 0;

                score += GetAnswerValue(q1.SelectedValue);
                score += GetAnswerValue(q2.SelectedValue);
                score += GetAnswerValue(q3.SelectedValue);

                Response.Redirect("QuizResult.aspx?score=" + score);
            }

            private int GetAnswerValue(string selectedValue)
            {
                int value = 0;
                int.TryParse(selectedValue, out value);
                return value;
            }
        </script>
    </div>
</form>
</body>
</html>
