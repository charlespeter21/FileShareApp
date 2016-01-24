<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportDownloadDetails.aspx.cs" Inherits="FileShareApp.Admin.ReportDownloadDetails" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
     <tr><td><div style="padding:7px;">FromDate</div></td>
       <td class="style3"><asp:TextBox ID="txtFromdateUpload" runat="server" ForeColor="Red" />
           <asp:Image ID="ImgUpload1"  runat="server" ImageUrl="~/css-admin/calendar.png"/>
           <ajaxToolkit:CalendarExtender ID="calupload1" runat="server" 
               TargetControlID="txtFromdateUpload" PopupButtonID="ImgUpload1">
           </ajaxToolkit:CalendarExtender></td>
           <td><div style="padding:7px;">ToDate:</div></td>
       <td class="style2"><asp:TextBox ID="txtTodateUpload" runat="server"  ForeColor="Red"  />
           <asp:Image ID="ImgUpload2" runat="server" ImageUrl="~/css-admin/calendar.png" />
           <ajaxToolkit:CalendarExtender ID="calupload2" runat="server" 
               TargetControlID="txtTodateUpload" PopupButtonID="ImgUpload2">
           </ajaxToolkit:CalendarExtender></td>
    
      <%--  From:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtFromDate" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtToDate" runat="server"></asp:TextBox>
        <br />
&nbsp;<br />--%>
       <td><div style="padding:7px;">User:</div></td>
        <td>
       <asp:DropDownList ID="ddlUsers" runat="server">
         </asp:DropDownList>
       </td>
         
       <td colspan="2">
        <asp:Button ID="btnShowReport" runat="server" Height="29px" 
            onclick="btnShowReport_Click" Text="View Report" Width="95px" 
               style="margin-left: 44px" />
        <br />
        </td></tr>
    </table>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <rsweb:ReportViewer ID="rptListDownloadDetails" runat="server" Width="90%" Height="100%">
    </rsweb:ReportViewer>
    </form>
</body>
</html>
