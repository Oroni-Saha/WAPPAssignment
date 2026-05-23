<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="WAPPAssignment.Courses" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Courses</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Available Courses</h2>
        <h3>Add New Course</h3>

        <asp:TextBox ID="txtCourseTitle" runat="server" placeholder="Course Title"></asp:TextBox><br /><br />

        <asp:TextBox ID="txtCourseDesc" runat="server" placeholder="Course Description"></asp:TextBox><br /><br />

        <asp:Button ID="btnAddCourse" runat="server" Text="Add Course" OnClick="btnAddCourse_Click" /><br /><br />

        <asp:Label ID="lblCourseMessage" runat="server"></asp:Label>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        <br /><br />
        <asp:GridView ID="gvCourses" runat="server" AutoGenerateColumns="false" 
    DataKeyNames="CourseID"
    OnRowEditing="gvCourses_RowEditing"
    OnRowUpdating="gvCourses_RowUpdating"
    OnRowCancelingEdit="gvCourses_RowCancelingEdit"
    OnRowDeleting="gvCourses_RowDeleting">

    <Columns>
        <asp:BoundField DataField="CourseID" HeaderText="ID" ReadOnly="true" />
        
        <asp:BoundField DataField="Title" HeaderText="Title" />
        
        <asp:BoundField DataField="Description" HeaderText="Description" />

        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
    </Columns>
</asp:GridView>

    </form>
</body>
</html>