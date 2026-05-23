<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseCatalog.aspx.cs" Inherits="WAPPAssignment.CourseCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .catalog-wrapper { padding: 50px 0; }
    .page-header {
        text-align: center;
        margin-bottom: 40px;
    }
    .page-header h1 { color: #ffffff; font-size: 36px; font-weight: 700; margin-bottom: 10px; }
    .page-header p { color: #94a3b8; font-size: 16px; }

    .filter-bar {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 16px 24px;
        margin-bottom: 32px;
        display: flex;
        align-items: center;
        gap: 14px;
        flex-wrap: wrap;
    }
    .filter-bar input {
        flex: 1;
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 8px;
        padding: 9px 14px;
        color: #e2e8f0;
        font-size: 14px;
        min-width: 200px;
    }
    .filter-bar input:focus { border-color: #6366f1; outline: none; }
    .filter-btn {
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 8px;
        padding: 9px 16px;
        color: #94a3b8;
        font-size: 13px;
        cursor: pointer;
    }
    .filter-btn.active, .filter-btn:hover {
        background: #6366f1;
        color: white;
        border-color: #6366f1;
    }
    .results-count { color: #94a3b8; font-size: 14px; margin-bottom: 20px; }
    .results-count span { color: #6366f1; font-weight: 700; }

    .course-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 14px;
        padding: 28px 22px;
        margin-bottom: 24px;
        transition: all 0.3s;
        height: 100%;
    }
    .course-card:hover { border-color: #6366f1; transform: translateY(-4px); }
    .course-card-icon { font-size: 42px; margin-bottom: 14px; }
    .course-card h3 { color: #ffffff; font-size: 18px; font-weight: 700; margin-bottom: 8px; }
    .course-card p { color: #94a3b8; font-size: 14px; margin-bottom: 16px; line-height: 1.6; }
    .course-meta {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
        margin-bottom: 18px;
    }
    .badge-level {
        background: #0f172a;
        border: 1px solid #334155;
        color: #94a3b8;
        font-size: 11px;
        padding: 3px 10px;
        border-radius: 20px;
    }
    .badge-category {
        background: #1e1b4b;
        color: #818cf8;
        font-size: 11px;
        padding: 3px 10px;
        border-radius: 20px;
    }
    .btn-details {
        width: 100%;
        background: #6366f1;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 10px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        text-decoration: none;
        display: block;
        text-align: center;
    }
    .btn-details:hover { background: #4f46e5; color: white; text-decoration: none; }
</style>

<div class="catalog-wrapper">
    <div class="container">

        <!-- PAGE HEADER -->
        <div class="page-header">
            <h1>Browse All Courses</h1>
            <p>Explore our library of programming courses designed for all skill levels</p>
        </div>

        <!-- FILTER BAR -->
        <div class="filter-bar">
            <input type="text" placeholder="🔍 Search courses..." />
            <button class="filter-btn active">All</button>
            <button class="filter-btn">HTML</button>
            <button class="filter-btn">CSS</button>
            <button class="filter-btn">JavaScript</button>
            <button class="filter-btn">Python</button>
        </div>

        <p class="results-count">Showing <span>4</span> courses available</p>

        <!-- COURSE CARDS -->
        <div class="row">
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-card-icon">🌐</div>
                    <h3>HTML Fundamentals</h3>
                    <p>Learn the structure of the web. Master HTML5 elements, forms, tables, and semantic markup.</p>
                    <div class="course-meta">
                        <span class="badge-level">🟢 Beginner</span>
                        <span class="badge-category">HTML</span>
                    </div>
                    <a href="#" class="btn-details">View Details</a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-card-icon">🎨</div>
                    <h3>CSS Styling</h3>
                    <p>Style beautiful websites with CSS3. Learn Flexbox, Grid, animations, and responsive design.</p>
                    <div class="course-meta">
                        <span class="badge-level">🟢 Beginner</span>
                        <span class="badge-category">CSS</span>
                    </div>
                    <a href="#" class="btn-details">View Details</a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-card-icon">⚡</div>
                    <h3>JavaScript Essentials</h3>
                    <p>Add interactivity to your pages. Learn DOM manipulation, events, and modern ES6+ features.</p>
                    <div class="course-meta">
                        <span class="badge-level">🟡 Intermediate</span>
                        <span class="badge-category">JavaScript</span>
                    </div>
                    <a href="#" class="btn-details">View Details</a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="course-card">
                    <div class="course-card-icon">🐍</div>
                    <h3>Python Basics</h3>
                    <p>Start your coding journey with Python. Learn variables, loops, functions, and problem solving.</p>
                    <div class="course-meta">
                        <span class="badge-level">🟢 Beginner</span>
                        <span class="badge-category">Python</span>
                    </div>
                    <a href="#" class="btn-details">View Details</a>
                </div>
            </div>
        </div>

    </div>
</div>

</asp:Content>