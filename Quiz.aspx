<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quiz.aspx.cs" Inherits="WAPPAssignment.Quiz" %>
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
        .btn { border-radius: 8px; margin-bottom: 5px; }
        .login-notice { background: #fef3c7; border: 1px solid #f59e0b; border-radius: 8px; padding: 14px; margin-bottom: 20px; color: #92400e; }
        @media (max-width: 900px) { .quiz-card { margin: 20px; padding: 22px; } }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="quiz-card">
        <div class="quiz-header">
            <h2>HTML Fundamentals Quiz</h2>
            <p>Answer all questions and submit to save your score.</p>
            <asp:Panel ID="pnlLoginNotice" runat="server" CssClass="login-notice" Visible="false">
                &#9888; You are not logged in. Your score will not be saved. <a href="Login.aspx">Login</a> to track your progress.
            </asp:Panel>
        </div>

        <section>
            <div class="question-box">
                <h4>1. What does HTML stand for?</h4>
                <asp:RadioButtonList ID="q1" runat="server">
                    <asp:ListItem Value="Hyper Text Markup Language">Hyper Text Markup Language</asp:ListItem>
                    <asp:ListItem Value="High Tech Modern Language">High Tech Modern Language</asp:ListItem>
                    <asp:ListItem Value="Home Tool Markup Language">Home Tool Markup Language</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvQ1" runat="server" ControlToValidate="q1"
                    ErrorMessage="Please answer question 1." ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="question-box">
                <h4>2. Which tag is used to create a paragraph?</h4>
                <asp:RadioButtonList ID="q2" runat="server">
                    <asp:ListItem Value="h1">&lt;h1&gt;</asp:ListItem>
                    <asp:ListItem Value="p">&lt;p&gt;</asp:ListItem>
                    <asp:ListItem Value="div">&lt;div&gt;</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvQ2" runat="server" ControlToValidate="q2"
                    ErrorMessage="Please answer question 2." ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="question-box">
                <h4>3. Which tag is used to insert an image?</h4>
                <asp:RadioButtonList ID="q3" runat="server">
                    <asp:ListItem Value="link">&lt;link&gt;</asp:ListItem>
                    <asp:ListItem Value="src">&lt;src&gt;</asp:ListItem>
                    <asp:ListItem Value="img">&lt;img&gt;</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvQ3" runat="server" ControlToValidate="q3"
                    ErrorMessage="Please answer question 3." ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </section>

        <div style="margin-top:20px;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Quiz" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            <a href="Courses.aspx" class="btn btn-default">Back to Courses</a>
            <a href="Default.aspx" class="btn btn-default">Home</a>
        </div>
    </div>
</form>
</body>
</html>
