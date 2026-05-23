<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WAPPAssignment.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .register-wrapper {
        min-height: 70vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 40px 0;
    }
    .register-box {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 16px;
        padding: 40px;
        width: 100%;
        max-width: 480px;
        margin: 0 auto;
    }
    .register-box h2 {
        color: #ffffff;
        font-size: 26px;
        font-weight: 700;
        text-align: center;
        margin-bottom: 6px;
    }
    .register-box p.subtitle {
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
    .form-row { display: flex; gap: 14px; }
    .form-row > div { flex: 1; }
    .btn-register {
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
    .btn-register:hover { background: #4f46e5; }
    .msg-error { color: #f87171; text-align: center; font-size: 14px; margin-bottom: 14px; }
    .msg-success { color: #4ade80; text-align: center; font-size: 14px; margin-bottom: 14px; }
    .register-links {
        text-align: center;
        margin-top: 18px;
        color: #94a3b8;
        font-size: 14px;
    }
    .register-links a { color: #6366f1; text-decoration: none; }
    .register-links a:hover { text-decoration: underline; }
    .role-select {
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
    .validation-msg { color: #f87171; font-size: 12px; display: block; margin-top: -14px; margin-bottom: 10px; }
</style>

<div class="register-wrapper">
    <div class="register-box">
        <h2>Create Account</h2>
        <p class="subtitle">Join CodeMaster Academy and start learning today</p>

        <asp:Label ID="lblMessage" runat="server" CssClass="msg-error"></asp:Label>

        <label class="form-label">Full Name</label>
        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control-custom" placeholder="Enter your full name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName"
            ErrorMessage="Full name is required." CssClass="validation-msg" Display="Dynamic"></asp:RequiredFieldValidator>

        <label class="form-label">Email Address</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control-custom" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="Email is required." CssClass="validation-msg" Display="Dynamic"></asp:RequiredFieldValidator>

        <label class="form-label">Password</label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control-custom" placeholder="Create a password" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
            ErrorMessage="Password is required." CssClass="validation-msg" Display="Dynamic"></asp:RequiredFieldValidator>

        <label class="form-label">Confirm Password</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control-custom" placeholder="Confirm your password" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword"
            ControlToCompare="txtPassword" ErrorMessage="Passwords do not match."
            CssClass="validation-msg" Display="Dynamic"></asp:CompareValidator>

        <label class="form-label">Role</label>
        <asp:DropDownList ID="ddlRole" runat="server" CssClass="role-select">
            <asp:ListItem Value="Student">Student</asp:ListItem>
            <asp:ListItem Value="Admin">Admin</asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn-register" OnClick="btnRegister_Click" />

        <div class="register-links">
            <p>Already have an account? <a href="Login.aspx">Login here</a></p>
        </div>
    </div>
</div>

</asp:Content>