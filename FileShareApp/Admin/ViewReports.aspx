<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="ViewReports.aspx.cs" Inherits="FileShareApp.Admin.ViewReports" %>
 <%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
       <form role="search">
        <div class="form-group" style="padding-bottom:50px;">
            <%--<input type="text" class="form-control" placeholder="Search">--%>
        </div>
        </form>
        <ul class="nav menu">
            <li ><a href="AdminHome.aspx">
                <svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg>
                Dashboard</a></li>
            <li><a href="ListFiles.aspx">
                <svg class="glyph stroked blank document"><use xlink:href="#stroked-blank-document"/></svg>
                Files</a></li>
            <li><a href="UploadFiles.aspx">
                <svg class="glyph stroked upload"><use xlink:href="#stroked-upload"/></svg>
                New Uploads</a></li>

           <li class="active"><a href="ViewReports.aspx">
           <svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Reports</a></li>

            <li ><a href="NewUser.aspx">
           <svg class="glyph stroked pen tip"><use xlink:href="#stroked-pen-tip"/></svg> New User</a></li>

           <li ><a href="ChangePassword.aspx">
           <svg class="glyph stroked lock"><use xlink:href="#stroked-lock"/></svg> Change Password</a></li>

            <li><a href="Logout.aspx">
                <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                Logout</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">	
<div class="row" style=" margin-left:0px; margin-top:60px;">
            <div class="col-lg-12" >
                <h1 class="page-header">
                    Files Upload</h1>
            </div>
        </div>		
		<div class="panel-body" style=" padding-left:0px; margin-top:00px;">
						<div >
							
							

                          <div class="col-lg-3 col-md-4 col-sm-6">
								<svg class="glyph stroked clipboard with paper"><use xlink:href="#stroked-clipboard-with-paper"/></svg><br />
                                <span style="padding-left:45px;">
								 <asp:HyperLink ID="Lnklistfile" runat="server" ForeColor="Black" Font-Size="18px" NavigateUrl="~/Admin/ReportAllFiles.aspx" Target="_blank" >List Files</asp:HyperLink></span>
							</div>
								
                            
                            <div class="col-lg-3 col-md-4 col-sm-6">
								<svg class="glyph stroked upload"><use xlink:href="#stroked-upload"/></svg><br />
								<span style="text-align:center; padding-left:20px;">
                               <asp:HyperLink ID="LnkUpload" runat="server" ForeColor="Black" Font-Size="18px"  NavigateUrl="~/Admin/ReportUpload.aspx" Target="_blank">Upload History</asp:HyperLink></span>
							</div>	
                            
                            <div class="col-lg-3 col-md-4 col-sm-6">
								<svg class="glyph stroked download"><use xlink:href="#stroked-download"/></svg><br />
								<span style="text-align:center; padding-left:10px;">
                               <asp:HyperLink ID="LnkDownload" runat="server" ForeColor="Black" Font-Size="18px" NavigateUrl="~/Admin/ReportDownload.aspx" Target="_blank">Download History</asp:HyperLink></span>
							</div>	
                            
                           <div class="col-lg-3 col-md-4 col-sm-6" style="margin-left:-25px;">
								<svg ><use xlink:href="#stroked-male-user"/></svg><br />
								<span style="text-align:center; padding-left:110px;">
                               <asp:HyperLink ID="LnkUser" runat="server" ForeColor="Black"
                                Font-Size="18px" NavigateUrl="~/Admin/ReportUser.aspx" Target="_blank">List Users</asp:HyperLink></span>
							</div>							
			<div >
				
              
			</div>
								
				
								
							</div>
						
						
					</div>
	</div>

        
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>




</asp:Content>

   