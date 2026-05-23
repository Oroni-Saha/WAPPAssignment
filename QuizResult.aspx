<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuizResult.aspx.cs" Inherits="WAPPAssignment.QuizResult" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Quiz Result</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <style>
        body { background: #f5f7fb; font-family: Arial, sans-serif; }
        .result-card { max-width: 700px; margin: 60px auto; background: white; padding: 40px; border-radius: 18px; box-shadow: 0 6px 18px rgba(0,0,0,0.08); text-align: center; }
        .result-card h2 { font-weight: 700; color: #1f2937; margin-bottom: 10px; }
        .score-box { background: #fbfdff; border: 1px solid #e5e7eb; border-radius: 16px; padding: 30px; margin-bottom: 25px; }
        .score-label { font-size: 24px; font-weight: bold; color: #337ab7; display: block; margin-bottom: 15px; }
        .status-label { font-size: 34px; font-weight: 800; display: block; }
        .save-note { font-size: 13px; color: #6b7280; margin-top: 12px; }
        .btn { border-radius: 8px; margin: 5px; }
        @media (max-width: 900px) { .result-card { margin: 20px; padding: 25px; } }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <article class="result-card">
        <h2>Quiz Result</h2>
        <p>HTML Fundamentals — Module Quiz</p>
        <div class="score-box">
            <asp:Label ID="lblScore" runat="server"></asp:Label>

            <asp:Label ID="lblStatus" runat="server"></asp:Label>

            <asp:Label ID="lblSaveNote" runat="server"></asp:Label>
        </div>
        <a href="Quiz.aspx" class="btn btn-primary">Retake Quiz</a>
        <a href="Dashboard.aspx" class="btn btn-default">My Dashboard</a>
        <a href="Default.aspx" class="btn btn-default">Home</a>
    </article>
</form>
</body>
</html>
