<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WAPPAssignment.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .about-wrapper {
        padding: 60px 0;
    }

    .about-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 16px;
        padding: 45px;
        color: white;
    }

    .about-card h1 {
        font-size: 42px;
        font-weight: 700;
        margin-bottom: 18px;
        color: #ffffff;
    }

    .about-card p {
        color: #cbd5e1;
        font-size: 16px;
        line-height: 1.8;
        margin-bottom: 18px;
    }

    .feature-box {
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 20px;
        margin-top: 20px;
        height: 100%;
    }

    .feature-box h3 {
        color: #818cf8;
        font-size: 20px;
        margin-bottom: 10px;
    }

    .feature-box p {
        color: #94a3b8;
        font-size: 14px;
        margin: 0;
    }
</style>

<div class="about-wrapper">
    <div class="container">

        <div class="about-card">

            <h1>About CodeMaster Academy</h1>

            <p>
                CodeMaster Academy is an online learning platform designed to help students
                improve their programming and web development skills through interactive
                courses and quizzes.
            </p>

            <p>
                Our platform provides beginner-friendly learning materials for HTML, CSS,
                JavaScript, Python, and other modern technologies. Students can browse
                courses, take quizzes, and track their learning progress through a simple
                and user-friendly system.
            </p>

            <p>
                This web application was developed using ASP.NET Web Forms and SQL Server
                as part of the Web Application Programming assignment project.
            </p>

            <div class="row">

                <div class="col-md-4">
                    <div class="feature-box">
                        <h3>📘 Courses</h3>
                        <p>
                            Browse programming courses designed for beginners and students.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="feature-box">
                        <h3>📝 Quizzes</h3>
                        <p>
                            Test your understanding through interactive quizzes and instant results.
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="feature-box">
                        <h3>📊 Progress</h3>
                        <p>
                            Track quiz scores and monitor your learning journey.
                        </p>
                    </div>
                </div>

            </div>

        </div>

    </div>
</div>

</asp:Content>
