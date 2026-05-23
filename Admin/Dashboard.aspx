<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WAPPAssignment.Admin.Dashboard" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Admin Dashboard</title>
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
        .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; margin-top: 25px; }
        .stat-card { background: #fbfdff; border: 1px solid #e5e7eb; border-radius: 14px; padding: 22px; }
        .stat-card h3 { margin-top: 0; color: #2c3e50; }
        .stat-number { font-size: 32px; font-weight: bold; color: #337ab7; }
        .action-card { margin-top: 25px; background: #fbfdff; border: 1px solid #e5e7eb; border-radius: 14px; padding: 22px; }
        .btn { border-radius: 8px; margin-bottom: 5px; }
        @media (max-width: 900px) { .admin-wrapper { flex-direction: column; margin: 20px; } .sidebar { width: auto; } .stats-grid { grid-template-columns: 1fr; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-wrapper">
            <div class="sidebar">
                <h3>CodeMaster</h3>
                <a href="Dashboard.aspx" class="active">Dashboard</a>
                <a href="ManageCourses.aspx">Course Management</a>
                <a href="ManageQuizzes.aspx">Quiz Management</a>
                <a href="ManageUsers.aspx">Manage Users</a>
                <a href="../Default.aspx">Main Website</a>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"
                    Style="margin-top:20px;width:100%;background:#ef4444;border:none;color:white;padding:10px;border-radius:8px;cursor:pointer;" />
            </div>
            <div class="main-content">
                <div class="page-card">
                    <h2>Admin Dashboard</h2>
                    <p>Welcome, <asp:Label ID="lblAdminName" runat="server" Text="Admin"></asp:Label>. Manage courses, quizzes, and users from here.</p>
                    <div class="stats-grid">
                        <div class="stat-card">
                            <h3>Registered Users</h3>
                            <div class="stat-number"><asp:Label ID="lblUserCount" runat="server" Text="0"></asp:Label></div>
                            <p>Total students registered</p>
                        </div>
                        <div class="stat-card">
                            <h3>Published Courses</h3>
                            <div class="stat-number"><asp:Label ID="lblCourseCount" runat="server" Text="0"></asp:Label></div>
                            <p>Available learning courses</p>
                        </div>
                        <div class="stat-card">
                            <h3>Quiz Attempts</h3>
                            <div class="stat-number"><asp:Label ID="lblAttemptCount" runat="server" Text="0"></asp:Label></div>
                            <p>Total quizzes completed</p>
                        </div>
                    </div>
                    <div class="action-card">
                        <h3>Quick Actions</h3>
                        <a href="ManageCourses.aspx" class="btn btn-primary">Manage Courses</a>
                        <a href="ManageQuizzes.aspx" class="btn btn-success">Manage Quizzes</a>
                        <a href="ManageUsers.aspx" class="btn btn-info">Manage Users</a>
                        <a href="../Default.aspx" class="btn btn-default">Go Home</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>