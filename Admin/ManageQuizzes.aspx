<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageQuizzes.aspx.cs" Inherits="WAPPAssignment.Admin.ManageQuizzes" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Quizzes</title>
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
        .section-box { background: #fbfdff; border: 1px solid #e5e7eb; border-radius: 14px; padding: 22px; margin-top: 25px; }
        .form-control { border-radius: 8px; }
        .btn { border-radius: 8px; margin-right: 5px; margin-bottom: 5px; }
        .table { width: 100%; }
        @media (max-width: 900px) { .admin-wrapper { flex-direction: column; margin: 20px; } .sidebar { width: auto; } }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-wrapper">
            <div class="sidebar">
                <h3>CodeMaster</h3>
                <a href="Dashboard.aspx">Dashboard</a>
                <a href="ManageCourses.aspx">Course Management</a>
                <a href="ManageQuizzes.aspx" class="active">Quiz Management</a>
                <a href="ManageUsers.aspx">Manage Users</a>
                <a href="../Default.aspx">Main Website</a>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"
                    Style="margin-top:20px;width:100%;background:#ef4444;border:none;color:white;padding:10px;border-radius:8px;cursor:pointer;" />
            </div>
            <div class="main-content">
                <div class="page-card">
                    <h2>Manage Quiz Questions</h2>
                    <asp:Label ID="lblMessage" runat="server" Style="display:block;margin-bottom:10px;font-weight:bold;"></asp:Label>

                    <!-- ADD QUESTION FORM -->
                    <div class="section-box">
                        <h3>Add New Question</h3>
                        <div class="form-group">
                            <label>Question Text</label>
                            <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control" placeholder="Enter question"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvQ" runat="server" ControlToValidate="txtQuestion"
                                ErrorMessage="Question is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Option A</label>
                                <asp:TextBox ID="txtA" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvA" runat="server" ControlToValidate="txtA"
                                    ErrorMessage="Option A required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Option B</label>
                                <asp:TextBox ID="txtB" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvB" runat="server" ControlToValidate="txtB"
                                    ErrorMessage="Option B required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Option C</label>
                                <asp:TextBox ID="txtC" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvC" runat="server" ControlToValidate="txtC"
                                    ErrorMessage="Option C required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Option D</label>
                                <asp:TextBox ID="txtD" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvD" runat="server" ControlToValidate="txtD"
                                    ErrorMessage="Option D required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Correct Answer</label>
                            <asp:DropDownList ID="ddlCorrect" runat="server" CssClass="form-control">
                                <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                                <asp:ListItem Text="Option A" Value="A"></asp:ListItem>
                                <asp:ListItem Text="Option B" Value="B"></asp:ListItem>
                                <asp:ListItem Text="Option C" Value="C"></asp:ListItem>
                                <asp:ListItem Text="Option D" Value="D"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCorrect" runat="server" ControlToValidate="ddlCorrect"
                                InitialValue="" ErrorMessage="Correct answer required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnSave" runat="server" Text="Save Question" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    </div>

                    <!-- QUESTIONS TABLE -->
                    <div class="section-box">
                        <h3>Existing Questions</h3>
                        <asp:GridView ID="gvQuestions" runat="server" CssClass="table table-bordered table-striped"
                            AutoGenerateColumns="false" DataKeyNames="QuestionID"
                            OnRowDeleting="gvQuestions_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="QuestionID" HeaderText="ID" ReadOnly="true" />
                                <asp:BoundField DataField="QuestionText" HeaderText="Question" />
                                <asp:BoundField DataField="OptionA" HeaderText="A" />
                                <asp:BoundField DataField="OptionB" HeaderText="B" />
                                <asp:BoundField DataField="OptionC" HeaderText="C" />
                                <asp:BoundField DataField="OptionD" HeaderText="D" />
                                <asp:BoundField DataField="CorrectAnswer" HeaderText="Correct" />
                                <asp:CommandField ShowDeleteButton="true" DeleteText="Delete" ButtonType="Button" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
