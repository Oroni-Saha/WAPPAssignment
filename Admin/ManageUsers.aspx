<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="WAPPAssignment.Admin.ManageUsers" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Users</title>
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
                <a href="ManageQuizzes.aspx">Quiz Management</a>
                <a href="ManageUsers.aspx" class="active">Manage Users</a>
                <a href="../Default.aspx">Main Website</a>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"
                    Style="margin-top:20px;width:100%;background:#ef4444;border:none;color:white;padding:10px;border-radius:8px;cursor:pointer;" />
            </div>
            <div class="main-content">
                <div class="page-card">
                    <h2>Manage Users</h2>
                    <asp:Label ID="lblMessage" runat="server" Style="display:block;margin-bottom:10px;font-weight:bold;"></asp:Label>

                    <!-- EDIT PANEL (shown when editing) -->
                    <asp:Panel ID="pnlEdit" runat="server" Visible="false">
                        <div class="section-box" style="border-color:#6366f1;">
                            <h3>Edit User</h3>
                            <asp:HiddenField ID="hfEditUserID" runat="server" />
                            <div class="form-group">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtEditName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtEditName"
                                    ErrorMessage="Name required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <asp:TextBox ID="txtEditEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEditEmail"
                                    ErrorMessage="Email required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>Role</label>
                                <asp:DropDownList ID="ddlEditRole" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:Button ID="btnSaveEdit" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="btnSaveEdit_Click" />
                            <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" CssClass="btn btn-default" OnClick="btnCancelEdit_Click" CausesValidation="false" />
                        </div>
                    </asp:Panel>

                    <!-- USERS TABLE -->
                    <div class="section-box">
                        <h3>Registered Users</h3>
                        <asp:GridView ID="gvUsers" runat="server" CssClass="table table-bordered table-striped"
                            AutoGenerateColumns="false" DataKeyNames="UserID"
                            OnRowCommand="gvUsers_RowCommand"
                            OnRowDeleting="gvUsers_RowDeleting">
                            <Columns>
                                <asp:BoundField DataField="UserID" HeaderText="ID" ReadOnly="true" />
                                <asp:BoundField DataField="FullName" HeaderText="Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="Role" HeaderText="Role" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:BoundField DataField="DateRegistered" HeaderText="Registered" DataFormatString="{0:dd MMM yyyy}" />
                                <asp:ButtonField Text="Edit" CommandName="EditUser" ButtonType="Button" ControlStyle-CssClass="btn btn-warning btn-sm" />
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

