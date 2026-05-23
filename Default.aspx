<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WAPPAssignment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    /* Hero Section */
    .hero-section {
        background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
        padding: 80px 0;
        text-align: center;
        border-bottom: 1px solid #334155;
    }
    .hero-section h1 {
        font-size: 52px;
        font-weight: 800;
        color: #ffffff;
        margin-bottom: 10px;
    }
    .hero-section h1 span { color: #6366f1; }
    .hero-section p {
        font-size: 18px;
        color: #94a3b8;
        margin-bottom: 30px;
    }
    .btn-primary-custom {
        background: #6366f1;
        color: white;
        padding: 14px 36px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        text-decoration: none;
        margin-right: 12px;
        display: inline-block;
        border: none;
    }
    .btn-primary-custom:hover { background: #4f46e5; color: white; text-decoration: none; }
    .btn-outline-custom {
        background: transparent;
        color: #6366f1;
        padding: 14px 36px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        border: 2px solid #6366f1;
    }
    .btn-outline-custom:hover { background: #6366f1; color: white; text-decoration: none; }

    /* Categories Section */
    .section-title {
        text-align: center;
        color: #ffffff;
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 10px;
    }
    .section-subtitle {
        text-align: center;
        color: #94a3b8;
        margin-bottom: 40px;
        font-size: 16px;
    }
    .course-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 30px 20px;
        text-align: center;
        margin-bottom: 24px;
        transition: all 0.3s;
    }
    .course-card:hover { border-color: #6366f1; transform: translateY(-4px); }
    .course-icon { font-size: 42px; margin-bottom: 14px; }
    .course-card h3 { color: #ffffff; font-size: 20px; margin-bottom: 8px; }
    .course-card p { color: #94a3b8; font-size: 14px; }
    .course-badge {
        display: inline-block;
        background: #6366f1;
        color: white;
        font-size: 12px;
        padding: 3px 10px;
        border-radius: 20px;
        margin-top: 10px;
    }

    /* Features Section */
    .features-section {
        background: #1e293b;
        padding: 60px 0;
        margin: 40px 0;
        border-top: 1px solid #334155;
        border-bottom: 1px solid #334155;
    }
    .feature-card {
        text-align: center;
        padding: 20px;
    }
    .feature-icon { font-size: 36px; margin-bottom: 14px; }
    .feature-card h4 { color: #ffffff; font-size: 18px; margin-bottom: 8px; }
    .feature-card p { color: #94a3b8; font-size: 14px; }

    /* CTA Section */
    .cta-section {
        background: linear-gradient(135deg, #4f46e5, #6366f1);
        padding: 60px 0;
        text-align: center;
        border-radius: 16px;
        margin: 40px 0;
    }
    .cta-section h2 { color: white; font-size: 32px; font-weight: 700; margin-bottom: 12px; }
    .cta-section p { color: #c7d2fe; font-size: 16px; margin-bottom: 28px; }
    .btn-white {
        background: white;
        color: #4f46e5;
        padding: 14px 36px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 700;
        text-decoration: none;
        display: inline-block;
    }
    .btn-white:hover { background: #e0e7ff; color: #4f46e5; text-decoration: none; }

    .section-padding { padding: 60px 0; }
</style>

<!-- HERO SECTION -->
<div class="hero-section">
    <div class="container">
        <h1>Learn to <span>Code</span> Online</h1>
        <p>Master programming with structured courses, interactive quizzes, and real projects.<br />
           Join thousands of learners building their future with CodeMaster Academy.</p>
        <a href="Register.aspx" class="btn-primary-custom">Get Started Free</a>
        <a href="CourseCatalog.aspx" class="btn-outline-custom">Browse Courses</a>
    </div>
</div>

<!-- COURSE CATEGORIES -->
<div class="section-padding">
    <div class="container">
        <h2 class="section-title">Explore Our Courses</h2>
        <p class="section-subtitle">Choose from our carefully designed programming courses for all skill levels</p>
        <div class="row">
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-icon">🌐</div>
                    <h3>HTML</h3>
                    <p>Learn the building blocks of every website with structured HTML5 content.</p>
                    <span class="course-badge">Beginner</span>
                </div>
            </div>
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-icon">🎨</div>
                    <h3>CSS</h3>
                    <p>Style your websites beautifully with modern CSS techniques and layouts.</p>
                    <span class="course-badge">Beginner</span>
                </div>
            </div>
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-icon">⚡</div>
                    <h3>JavaScript</h3>
                    <p>Add interactivity and logic to your web pages with JavaScript.</p>
                    <span class="course-badge">Intermediate</span>
                </div>
            </div>
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-icon">🐍</div>
                    <h3>Python</h3>
                    <p>Start your programming journey with the world's most beginner-friendly language.</p>
                    <span class="course-badge">Beginner</span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- FEATURES SECTION -->
<div class="features-section">
    <div class="container">
        <h2 class="section-title">Why CodeMaster Academy?</h2>
        <p class="section-subtitle">Everything you need to become a confident developer</p>
        <div class="row">
            <div class="col-md-3">
                <div class="feature-card">
                    <div class="feature-icon">📚</div>
                    <h4>Structured Learning</h4>
                    <p>Follow a clear curriculum designed to take you from beginner to confident coder.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="feature-card">
                    <div class="feature-icon">✅</div>
                    <h4>Interactive Quizzes</h4>
                    <p>Test your knowledge after every module with instant feedback and scoring.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="feature-card">
                    <div class="feature-icon">📊</div>
                    <h4>Progress Tracking</h4>
                    <p>Monitor your learning journey with visual progress bars and completion stats.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="feature-card">
                    <div class="feature-icon">🔒</div>
                    <h4>Secure Platform</h4>
                    <p>Your data and learning progress are safe with our secure login system.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- CTA SECTION -->
<div class="container">
    <div class="cta-section">
        <h2>Ready to Start Your Coding Journey?</h2>
        <p>Join CodeMaster Academy today and get access to all courses for free.</p>
        <a href="Register.aspx" class="btn-white">Create Free Account</a>
    </div>
</div>

</asp:Content>