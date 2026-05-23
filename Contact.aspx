<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WAPPAssignment.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .contact-wrapper {
        padding: 60px 0;
    }

    .contact-card {
        background: #1e293b;
        border: 1px solid #334155;
        border-radius: 16px;
        padding: 45px;
        color: white;
    }

    .contact-card h1 {
        font-size: 42px;
        font-weight: 700;
        margin-bottom: 12px;
        color: #ffffff;
    }

    .contact-card p {
        color: #94a3b8;
        font-size: 16px;
        margin-bottom: 30px;
    }

    .contact-box {
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 12px;
        padding: 24px;
        margin-bottom: 20px;
        height: 100%;
    }

    .contact-box h3 {
        color: #818cf8;
        margin-bottom: 12px;
        font-size: 20px;
    }

    .contact-box p {
        color: #cbd5e1;
        font-size: 15px;
        margin: 0;
        line-height: 1.8;
    }

    .contact-form {
        margin-top: 35px;
    }

    .contact-form input,
    .contact-form textarea {
        width: 100%;
        background: #0f172a;
        border: 1px solid #334155;
        border-radius: 10px;
        padding: 14px;
        color: white;
        margin-bottom: 18px;
    }

    .contact-form input:focus,
    .contact-form textarea:focus {
        border-color: #6366f1;
        outline: none;
    }

    .btn-send {
        background: #6366f1;
        color: white;
        border: none;
        border-radius: 10px;
        padding: 12px 28px;
        font-size: 15px;
        font-weight: 600;
    }

    .btn-send:hover {
        background: #4f46e5;
    }
</style>

<div class="contact-wrapper">
    <div class="container">

        <div class="contact-card">

            <h1>Contact Us</h1>

            <p>
                Have questions about courses, quizzes, or your learning progress?
                Reach out to the CodeMaster Academy team.
            </p>

            <div class="row">

                <div class="col-md-4">
                    <div class="contact-box">
                        <h3>📍 Address</h3>
                        <p>
                            CodeMaster Academy<br />
                            Kuala Lumpur, Malaysia
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="contact-box">
                        <h3>📧 Email</h3>
                        <p>
                            support@codemaster.com<br />
                            admin@codemaster.com
                        </p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="contact-box">
                        <h3>📞 Phone</h3>
                        <p>
                            +60 12-345 6789<br />
                            Mon - Fri, 9AM - 5PM
                        </p>
                    </div>
                </div>

            </div>

            <div class="contact-form">

    <h3 style="margin-bottom:20px;">Send Us a Message</h3>

    <!-- NAME -->
    <asp:TextBox ID="txtName"
        runat="server"
        placeholder="Your Name">
    </asp:TextBox>

    <asp:RequiredFieldValidator
        ID="rfvName"
        runat="server"
        ControlToValidate="txtName"
        ErrorMessage="Name is required"
        ForeColor="#ef4444"
        Display="Dynamic">
    </asp:RequiredFieldValidator>

    <!-- EMAIL -->
    <asp:TextBox ID="txtEmail"
        runat="server"
        placeholder="Your Email">
    </asp:TextBox>

    <asp:RequiredFieldValidator
        ID="rfvEmail"
        runat="server"
        ControlToValidate="txtEmail"
        ErrorMessage="Email is required"
        ForeColor="#ef4444"
        Display="Dynamic">
    </asp:RequiredFieldValidator>

    <asp:RegularExpressionValidator
        ID="revEmail"
        runat="server"
        ControlToValidate="txtEmail"
        ValidationExpression="^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$"
        ErrorMessage="Invalid email format"
        ForeColor="#ef4444"
        Display="Dynamic">
    </asp:RegularExpressionValidator>

    <!-- MESSAGE -->
    <asp:TextBox ID="txtMessage"
        runat="server"
        TextMode="MultiLine"
        Rows="5"
        placeholder="Your Message">
    </asp:TextBox>

    <asp:RequiredFieldValidator
        ID="rfvMessage"
        runat="server"
        ControlToValidate="txtMessage"
        ErrorMessage="Message is required"
        ForeColor="#ef4444"
        Display="Dynamic">
    </asp:RequiredFieldValidator>

    <!-- BUTTON -->
    <asp:Button ID="btnSend"
        runat="server"
        Text="Send Message"
        CssClass="btn-send"
        OnClick="btnSend_Click" />

</div>

        </div>

    </div>
</div>

</asp:Content>
