<<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WAPPAssignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .dashboard-wrapper { padding: 40px 0; }
    .welcome-bar {
        background: linear-gradient(135deg, #4f46e5, #6366f1);
        border-radius: 14px; padding: 30px 36px; margin-bottom: 30px; color: white;
    }
    .welcome-bar h2 { font-size: 28px; font-weight: 700; margin-bottom: 6px; }
    .welcome-bar p { font-size: 15px; color: #c7d2fe; margin: 0; }
    .stat-card {
        background: #1e293b; border: 1px solid #334155; border-radius: 12px;
        padding: 24px; text-align: center; margin-bottom: 24px;
    }
    .stat-card .stat-icon { font-size: 32px; margin-bottom: 10px; }
    .stat-card h3 { color: #6366f1; font-size: 32px; font-weight: 700; margin-bottom: 4px; }
    .stat-card p { color: #94a3b8; font-size: 14px; margin: 0; }
    .section-title {
        color: #ffffff; font-size: 20px; font-weight: 700; margin-bottom: 18px;
        padding-bottom: 10px; border-bottom: 1px solid #334155;
    }
    .table-dark-custom { background: #1e293b; border-radius: 10px; overflow: hidden; width: 100%; border-collapse: collapse; }
    .table-dark-custom th { background: #0f172a; color: #6366f1; padding: 12px 16px; font-size: 13px; text-align: left; }
    .table-dark-custom td { padding: 12px 16px; color: #e2e8f0; font-size: 14px; border-top: 1px solid #334155; }
    .table-dark-custom tr:hover td { background: #0f172a; }
    .empty-msg { color: #94a3b8; font-size: 14px; padding: 20px 0; text-align: center; }
    .btn-quiz-nav {
        background: #6366f1; color: white; padding: 10px 24px; border-radius: 8px;
        text-decoration: none; display: inline-block; font-weight: 600; margin-top: 16px;
    }
    .btn-quiz-nav:hover { background: #4f46e5; color: white; text-decoration: none; }
    .btn-logout {
        background: transparent; border: 1px solid #ef4444; color: #ef4444;
        padding: 8px 20px; border-radius: 8px; cursor: pointer; font-size: 14px;
    }
    .btn-logout:hover { background: #ef4444; color: white; }
</style>

<div class="dashboard-wrapper">
    <div class="container">

        <!-- WELCOME BAR -->
        <div class="welcome-bar">
            <div style="display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:12px;">
                <div>
                    <h2><asp:Label ID="lblWelcome" runat="server" Text="Welcome back!"></asp:Label></h2>
                    <p>Track your learning progress and take quizzes below.</p>
                </div>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
            </div>
        </div>

        <!-- STATS ROW -->
        <div class="row">
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">&#128218;</div>
                    <h3><asp:Label ID="lblCourseCount" runat="server" Text="0"></asp:Label></h3>
                    <p>Courses Available</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">&#128101;</div>
                    <h3><asp:Label ID="lblStudentCount" runat="server" Text="0"></asp:Label></h3>
                    <p>Total Students</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">&#9989;</div>
                    <h3><asp:Label ID="lblQuizCount" runat="server" Text="0"></asp:Label></h3>
                    <p>Quizzes Taken</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">&#127942;</div>
                    <h3><asp:Label ID="lblAvgScore" runat="server" Text="N/A"></asp:Label></h3>
                    <p>Average Score</p>
                </div>
            </div>
        </div>

        <!-- RECENT QUIZ ATTEMPTS -->
        <div class="section-title">&#128221; Your Recent Quiz Attempts</div>
        <asp:GridView ID="gvRecentQuizzes" runat="server" CssClass="table-dark-custom"
            AutoGenerateColumns="false" EmptyDataText="No quiz attempts yet.">
            <Columns>
                <asp:BoundField DataField="AttemptDate" HeaderText="Date" DataFormatString="{0:dd MMM yyyy HH:mm}" />
                <asp:BoundField DataField="Score" HeaderText="Score" />
                <asp:BoundField DataField="TotalQuestions" HeaderText="Total Questions" />
            </Columns>
        </asp:GridView>

        <div style="margin-top:30px;">
            <a href="CourseCatalog.aspx" class="btn-quiz-nav">&#128218; Browse Courses</a>
            &nbsp;
            <a href="Quiz.aspx" class="btn-quiz-nav" style="background:#059669;">&#128221; Take a Quiz</a>
        </div>

    </div>
</div>

</asp:Content>