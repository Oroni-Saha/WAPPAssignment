<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WAPPAssignment.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .dashboard-wrapper { padding: 40px 0; }
    .welcome-bar {
        background: linear-gradient(135deg, #4f46e5, #6366f1);
        border-radius: 14px;
        padding: 30px 36px;
        margin-bottom: 30px;
        color: white;
    }
    .welcome-bar h2 { font-size: 28px; font-weight: 700; margin-bottom: 6px; }
    .welcome-bar p { font-size: 15px; color: #c7d2fe; margin: 0; }

    .stat-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 24px;
        text-align: center;
        margin-bottom: 24px;
    }
    .stat-card .stat-icon { font-size: 32px; margin-bottom: 10px; }
    .stat-card h3 { color: #6366f1; font-size: 32px; font-weight: 700; margin-bottom: 4px; }
    .stat-card p { color: #94a3b8; font-size: 14px; margin: 0; }

    .section-title {
        color: #ffffff;
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 18px;
        padding-bottom: 10px;
        border-bottom: 1px solid #334155;
    }

    .course-progress-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 20px 24px;
        margin-bottom: 16px;
    }
    .course-progress-card h4 { color: #ffffff; font-size: 16px; margin-bottom: 6px; }
    .course-progress-card p { color: #94a3b8; font-size: 13px; margin-bottom: 12px; }
    .progress-bar-wrapper {
        background: #0f172a;
        border-radius: 20px;
        height: 10px;
        margin-bottom: 10px;
    }
    .progress-bar-fill {
        height: 10px;
        border-radius: 20px;
        background: linear-gradient(90deg, #6366f1, #818cf8);
    }
    .progress-label {
        display: flex;
        justify-content: space-between;
        color: #94a3b8;
        font-size: 12px;
    }
    .btn-continue {
        background: #6366f1;
        color: white;
        border: none;
        border-radius: 6px;
        padding: 7px 18px;
        font-size: 13px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        margin-top: 8px;
    }
    .btn-continue:hover { background: #4f46e5; color: white; text-decoration: none; }

    .quiz-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 18px 22px;
        margin-bottom: 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .quiz-card h4 { color: #ffffff; font-size: 15px; margin: 0 0 4px 0; }
    .quiz-card p { color: #94a3b8; font-size: 13px; margin: 0; }
    .quiz-badge {
        background: #f59e0b;
        color: #000;
        font-size: 11px;
        font-weight: 700;
        padding: 4px 10px;
        border-radius: 20px;
    }

    .catalog-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 22px;
        margin-bottom: 20px;
        text-align: center;
    }
    .catalog-card .cat-icon { font-size: 36px; margin-bottom: 10px; }
    .catalog-card h4 { color: #ffffff; font-size: 16px; margin-bottom: 6px; }
    .catalog-card p { color: #94a3b8; font-size: 13px; margin-bottom: 14px; }
    .btn-enroll {
        background: transparent;
        border: 2px solid #6366f1;
        color: #6366f1;
        border-radius: 6px;
        padding: 7px 18px;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
    }
    .btn-enroll:hover { background: #6366f1; color: white; text-decoration: none; }
</style>

<div class="dashboard-wrapper">
    <div class="container">

        <!-- WELCOME BAR -->
        <div class="welcome-bar">
            <h2>Welcome back, Student! 👋</h2>
            <p>Continue your learning journey — you're doing great!</p>
        </div>

        <!-- STATS ROW -->
        <div class="row">
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">📚</div>
                    <h3>3</h3>
                    <p>Courses Enrolled</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">✅</div>
                    <h3>12</h3>
                    <p>Lessons Completed</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">🏆</div>
                    <h3>85%</h3>
                    <p>Average Quiz Score</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <div class="stat-icon">⏱️</div>
                    <h3>8h</h3>
                    <p>Time Spent Learning</p>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- MY PROGRESS -->
            <div class="col-md-7">
                <div class="section-title">📈 My Progress</div>

                <div class="course-progress-card">
                    <h4>🌐 HTML Fundamentals</h4>
                    <p>Next Lesson: Forms and Input Elements</p>
                    <div class="progress-bar-wrapper">
                        <div class="progress-bar-fill" style="width: 75%;"></div>
                    </div>
                    <div class="progress-label"><span>Progress</span><span>75%</span></div>
                    <a href="CourseCatalog.aspx" class="btn-continue">Continue →</a>
                </div>

                <div class="course-progress-card">
                    <h4>🎨 CSS Styling</h4>
                    <p>Next Lesson: Flexbox Layout</p>
                    <div class="progress-bar-wrapper">
                        <div class="progress-bar-fill" style="width: 45%;"></div>
                    </div>
                    <div class="progress-label"><span>Progress</span><span>45%</span></div>
                    <a href="CourseCatalog.aspx" class="btn-continue">Continue →</a>
                </div>

                <div class="course-progress-card">
                    <h4>🐍 Python Basics</h4>
                    <p>Next Lesson: Functions and Loops</p>
                    <div class="progress-bar-wrapper">
                        <div class="progress-bar-fill" style="width: 20%;"></div>
                    </div>
                    <div class="progress-label"><span>Progress</span><span>20%</span></div>
                    <a href="CourseCatalog.aspx" class="btn-continue">Continue →</a>
                </div>
            </div>

            <!-- UPCOMING QUIZZES -->
            <div class="col-md-5">
                <div class="section-title">📝 Upcoming Quizzes</div>

                <div class="quiz-card">
                    <div>
                        <h4>HTML Forms Quiz</h4>
                        <p>HTML Fundamentals · Module 3</p>
                    </div>
                    <span class="quiz-badge">Due Soon</span>
                </div>

                <div class="quiz-card">
                    <div>
                        <h4>CSS Flexbox Quiz</h4>
                        <p>CSS Styling · Module 2</p>
                    </div>
                    <span class="quiz-badge">Due Soon</span>
                </div>

                <div class="quiz-card">
                    <div>
                        <h4>Python Functions Quiz</h4>
                        <p>Python Basics · Module 1</p>
                    </div>
                    <span class="quiz-badge">Upcoming</span>
                </div>

                <!-- BROWSE MORE -->
                <div class="section-title" style="margin-top:30px;">🔍 Browse More Courses</div>
                <div class="catalog-card">
                    <div class="cat-icon">⚡</div>
                    <h4>JavaScript</h4>
                    <p>Add interactivity to your web pages</p>
                    <a href="CourseCatalog.aspx" class="btn-enroll">Enroll Now</a>
                </div>
            </div>
        </div>

    </div>
</div>

</asp:Content>