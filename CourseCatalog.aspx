<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseCatalog.aspx.cs" Inherits="WAPPAssignment.CourseCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .catalog-wrapper { padding: 50px 0; }

    .page-header {
        text-align: center;
        margin-bottom: 40px;
    }

    .page-header h1 {
        color: #ffffff;
        font-size: 42px;
        font-weight: 700;
        margin-bottom: 10px;
    }

    .page-header p {
        color: #94a3b8;
        font-size: 16px;
    }

    .results-count {
        color: #94a3b8;
        font-size: 14px;
        margin-bottom: 25px;
    }

    .results-count span {
        color: #6366f1;
        font-weight: 700;
    }

    .course-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 14px;
        padding: 28px 22px;
        margin-bottom: 24px;
        transition: all 0.3s;
        height: 100%;
    }

    .course-card:hover {
        border-color: #6366f1;
        transform: translateY(-4px);
    }

    .course-card-icon {
        font-size: 42px;
        margin-bottom: 14px;
    }

    .course-card h3 {
        color: #ffffff;
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 8px;
    }

    .course-card p {
        color: #94a3b8;
        font-size: 14px;
        margin-bottom: 16px;
        line-height: 1.6;
    }

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

    .btn-details:hover {
        background: #4f46e5;
        color: white;
        text-decoration: none;
    }
</style>

<main class="catalog-wrapper">

    <div class="container">

        <header class="page-header">
            <h1>Browse All Courses</h1>
            <p>Explore programming courses available in CodeMaster Academy</p>
        </header>

        <p class="results-count">
            Showing <span><asp:Label ID="lblCourseCount" runat="server" Text="0"></asp:Label></span> courses available
        </p>

        <section>

            <asp:Repeater ID="rptCourses" runat="server">

                <HeaderTemplate>
                    <div class="row">
                </HeaderTemplate>

                <ItemTemplate>

                    <div class="col-md-3">

                        <article class="course-card">

                            <div class="course-card-icon">📘</div>

                            <h3><%# Eval("Title") %></h3>

                            <p><%# Eval("Description") %></p>

                            <div class="course-meta">
                                <span class="badge-level">🟢 <%# Eval("DifficultyLevel") %></span>
                                <span class="badge-category"><%# Eval("Category") %></span>
                            </div>

                            <a href="Quiz.aspx?courseId=<%# Eval("CourseID") %>" class="btn-details">
                                Start Course
                            </a>

                        </article>

                    </div>

                </ItemTemplate>

                <FooterTemplate>
                    </div>
                </FooterTemplate>

            </asp:Repeater>

        </section>

    </div>

</main>

</asp:Content>