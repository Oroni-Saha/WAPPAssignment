<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WAPPAssignment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .hero-section {
        padding: 90px 0;
        text-align: center;
        background: linear-gradient(135deg, #4f46e5, #6366f1);
        border-radius: 18px;
        margin-top: 20px;
        color: white;
    }

    .hero-section h1 {
        font-size: 52px;
        font-weight: 700;
        margin-bottom: 16px;
    }

    .hero-section p {
        font-size: 18px;
        color: #e0e7ff;
    }

    .features-section {
        padding: 50px 0;
    }

    .feature-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 14px;
        padding: 30px;
        margin-bottom: 24px;
        color: white;
    }

    .feature-card h2 {
        color: #818cf8;
        margin-bottom: 14px;
    }

    .feature-card p {
        color: #cbd5e1;
        line-height: 1.7;
    }
</style>

<main>

    <header class="hero-section">
        <div class="container">
            <h1>Welcome to CodeMaster Academy</h1>
            <p>Learn programming through interactive courses and quizzes.</p>
        </div>
    </header>

    <section class="features-section">
        <div class="container">

            <article class="feature-card">
                <h2>📚 Courses</h2>
                <p>
                    Browse beginner-friendly programming courses including HTML, CSS,
                    JavaScript, and Python.
                </p>
            </article>

            <article class="feature-card">
                <h2>📝 Interactive Quizzes</h2>
                <p>
                    Test your understanding with quizzes and receive instant results
                    and feedback.
                </p>
            </article>

            <article class="feature-card">
                <h2>📈 Progress Tracking</h2>
                <p>
                    Track your learning progress and monitor completed modules
                    through your dashboard.
                </p>
            </article>

        </div>
    </section>

</main>

</asp:Content>