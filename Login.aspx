<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WAPPAssignment.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .login-wrapper {
        min-height: 70vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 40px 0;
    }
    .login-box {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 16px;
        padding: 40px;
        width: 100%;
        max-width: 420px;
        margin: 0 auto;
    }
    .login-box h2 {
        color: #ffffff;
        font-size: 26px;
        font-weight: 700;
        text-align: center;
        margin-bottom: 6px;
    }
    .login-box p.subtitle {
        color: #94a3b8;
        text-align: center;
        margin-bottom: 28px;
        font-size: 14px;
    }
    .form-label {
        color: #cbd5e1;
        font-size: 14px;
        font-weight: 600;
        margin-bottom: 6px;
        display: block;
    }
    .form-control-custom {
        width: 100%;
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 8px;
        padding: 10px 14px;
        color: #e2e8f0;
        font-size: 15px;
        margin-bottom: 18px;
        box-sizing: border-box;
    }
    .form-control-custom:focus {
        border-color: #6366f1;
        outline: none;
    }
    .btn-login {
        width: 100%;
        background: #6366f1;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        margin-top: 6px;
    }
    .btn-login:hover { background: #4f46e5; }
    .msg-error {
        color: #f87171;
        text-align: center;
        font-size: 14px;
        margin-bottom: 14px;
    }
    .login-links {
        text-align: center;
        margin-top: 18px;
        color: #94a3b8;
        font-size: 14px;
    }
    .login-links a { color: #6366f1; text-decoration: none; }
    .login-links a:hover { text-decoration: underline; }
    .demo-box {
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 8px;
        padding: 14px;
        margin-bottom: 22px;
        font-size: 13px;
        color: #94a3b8;
    }
    .demo-box strong { color: #6366f1; }
</style>

<div class="login-wrapper">
    <div class="login-box">
        <h2>Welcome Back</h2>
        <p class="subtitle">Login to continue your learning journey</p>

        <div class="demo-box">
            <strong>Demo Credentials:</strong><br />
            Student — student@codemaster.com / student123<br />
            Admin — admin@codemaster.com / admin123
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="msg-error"></asp:Label>

        <label class="form-label">Email Address</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control-custom" placeholder="Enter your email" TextMode="Email"></asp:TextBox>

        <label class="form-label">Password</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control-custom" placeholder="Enter your password" TextMode="Password"></asp:TextBox>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

        <div class="login-links">
            <p>Don't have an account? <a href="Register.aspx">Register here</a></p>
            <p><a href="#">Forgot Password?</a></p>
        </div>
    </div>
</div>

</asp:Content>