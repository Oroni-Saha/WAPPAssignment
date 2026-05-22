<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Quiz Result</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />

    <style>
        body { background: #f5f7fb; font-family: Arial, sans-serif; }
        .result-card { max-width: 800px; margin: 60px auto; background: white; padding: 40px; border-radius: 18px; box-shadow: 0 6px 18px rgba(0,0,0,0.08); text-align: center; }
        .result-card h2 { font-weight: 700; color: #1f2937; margin-bottom: 10px; }
        .module-path { color: #6b7280; margin-bottom: 30px; }
        .score-box { background: #fbfdff; border: 1px solid #e5e7eb; border-radius: 16px; padding: 30px; margin-bottom: 25px; }
        .score-label { font-size: 24px; font-weight: bold; color: #337ab7; display: block; margin-bottom: 15px; }
        .status-label { font-size: 34px; font-weight: 800; display: block; }
        .btn { border-radius: 8px; margin: 5px; }

        @media (max-width: 900px) {
            .result-card { margin: 20px; padding: 25px; }
            .status-label { font-size: 28px; }
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="result-card">
        <h2>Quiz Result</h2>
       <p class="module-path">HTML Fundamentals - Module Quiz</p>

        <div class="score-box">
            <asp:Label ID="lblScore" runat="server" CssClass="score-label"></asp:Label>
            <asp:Label ID="lblStatus" runat="server" CssClass="status-label"></asp:Label>
        </div>

       <a href="Quiz.aspx" class="btn btn-primary">Retake Quiz</a>
<a href="Admin/Dashboard.aspx" class="btn btn-default">Back to Admin Dashboard</a>
<a href="Courses.aspx" class="btn btn-default">Back to Courses</a>
<a href="Default.aspx" class="btn btn-default">Back Home</a>

        <script runat="server">
            protected void Page_Load(object sender, EventArgs e)
            {
                int score = 0;

                if (Request.QueryString["score"] != null)
                {
                    int.TryParse(Request.QueryString["score"], out score);
                }

                if (score < 0 || score > 3)
                {
                    score = 0;
                }

                lblScore.Text = "Your Score: " + score + " / 3";

                if (score >= 2)
                {
                    lblStatus.Text = "PASSED";
                    lblStatus.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblStatus.Text = "FAILED";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        </script>
    </div>
</form>
</body>
</html>