<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isLoggedIn =
            Session["UserID"] != null ||
            Session["Username"] != null ||
            Session["AdminID"] != null ||
            Session["Email"] != null;

       // if (!isLoggedIn)
       // {
         //   Response.Redirect("~/Login.aspx");
        //}
    }
</script>

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

        @media (max-width: 900px) {
            .admin-wrapper { flex-direction: column; margin: 20px; }
            .sidebar { width: auto; }
            .stats-grid { grid-template-columns: 1fr; }
        }
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
                <a href="../Quiz.aspx">Preview Quiz</a>
                <a href="../Default.aspx">Main Website</a>
            </div>

            <div class="main-content">
                <div class="page-card">
                    <h2>Admin Dashboard</h2>
                    <p>Welcome to the CodeMaster Academy admin panel. Manage courses, quizzes, and system features from one place.</p>

                    <div class="stats-grid">
                        <div class="stat-card">
                            <h3>Active Users</h3>
                            <div class="stat-number">342</div>
                            <p>Users active in the last 24 hours</p>
                        </div>

                        <div class="stat-card">
                            <h3>Published Courses</h3>
                            <div class="stat-number">4</div>
                            <p>Available learning courses</p>
                        </div>

                        <div class="stat-card">
                            <h3>Pending Reviews</h3>
                            <div class="stat-number">2</div>
                            <p>Courses awaiting review</p>
                        </div>
                    </div>

                    <div class="action-card">
                        <h3>Quick Actions</h3>
                        <p>Use these shortcuts to manage the main learning features.</p>
                        <a href="ManageCourses.aspx" class="btn btn-primary">Manage Courses</a>
                        <a href="ManageQuizzes.aspx" class="btn btn-success">Manage Quizzes</a>
                        <a href="../Quiz.aspx" class="btn btn-warning">Preview Quiz</a>
                        <a href="../Default.aspx" class="btn btn-info">Go Home</a>
                    </div>

                    <div class="action-card">
                        <h3>Recent User Activity</h3>
                        <ul>
                            <li>New student registered for HTML Fundamentals.</li>
                            <li>Quiz attempt completed for CSS Basics.</li>
                            <li>JavaScript Introduction marked as draft.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>