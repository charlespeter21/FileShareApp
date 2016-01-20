<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="UploadFiles.aspx.cs" Inherits="FileShareApp.Admin.UploadFiles" %>
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
            <li ><a href="ListFiles.aspx">
                <svg class="glyph stroked blank document"><use xlink:href="#stroked-blank-document"/></svg>
                Files</a></li>
            <li class="active"><a href="UploadFiles.aspx">
                <svg class="glyph stroked upload"><use xlink:href="#stroked-upload"/></svg>
                New Uploads</a></li>
           <li ><a href="ViewReports.aspx">
           <svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Reports</a></li>
            <li><a href="Logout.aspx">
                <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                Logout</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
<div class="row" style=" margin-left:0px; margin-top:0px;>
            <div class="col-lg-12" >
                <h1 class="page-header">
                    Files Upload</h1>
            </div>
        </div>		
		<div class="panel-body" style=" padding-left:400px; margin-top:50px;">
						
					
								
																
			<div >
				
           <%-- <h1 style=" font-size:20px; font-weight:bold; padding-bottom:5px; ">File <span>Upload</span></h1>--%>
            <h4> Hi User, Please select the file you need to upload</h4>
            <h4> please upload the folder file as zip format</h4>
                Select Files: <asp:FileUpload ID="FileUpload1" AllowMultiple="True" runat="server"  />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_FileUpload1" ForeColor="Red" runat="server"
                    ControlToValidate="FileUpload1" ValidationGroup="check" ErrorMessage="File Required!"> </asp:RequiredFieldValidator>
        &nbsp;<br /><br />
                <asp:ImageButton ID="btnsubmit" runat="server" Text="Upload" ImageUrl="~/css-admin/upload.png"
                    ValidationGroup="check" onclick="btnsubmit_Click"  /> 
              
			</div>
								
				
								
						
						
					</div>
	</div>
</asp:Content>
