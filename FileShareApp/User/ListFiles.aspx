<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserHeader.Master" AutoEventWireup="true" CodeBehind="ListFiles.aspx.cs" Inherits="FileShareApp.User.ListFiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
       <form role="search">
        <div class="form-group" style="padding-bottom:50px;">
            <%--<input type="text" class="form-control" placeholder="Search">--%>
        </div>
        </form>
        <ul class="nav menu">
            <li ><a href="Home.aspx">
                <svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg>
                Dashboard</a></li>
            <li class="active"><a href="ListFiles.aspx">
                <svg class="glyph stroked blank document"><use xlink:href="#stroked-blank-document"/></svg>
                Files</a></li>
            <li><a href="UploadFiles.aspx">
                <svg class="glyph stroked upload"><use xlink:href="#stroked-upload"/></svg>
                New Uploads</a></li>
           <%--<li ><a href="ViewReports.aspx">
           <svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Reports</a></li>--%>
            <li><a href="Logout.aspx">
                <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                Logout</a></li>
        </ul>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			

    <div class="grid_12" style=" padding-left:0px; margin-top:50px;">
                
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Files</h1>
            </div>
        </div>
                
                
                <!-- Example table -->
                <div class="module">
                <form>
                	<h2><span style="float:right; padding-right: 20px; margin-top:-5px;"> <asp:TextBox ID="txtsearch" runat="server" ></asp:TextBox>
                        <asp:ImageButton ID="btnsearch" runat="server"    Width="18px" Height="18px" 
                            ImageUrl="~/css-admin/111.png" onclick="btnsearch_Click" /></span>  </h2> </form>
                    
                    <div class="module-table-body">
                    	<form action="">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th style="width:50px;">#</th>
                                    <th style="width:500px;">File Name</th>
                                    <th style="width:100px;">File Type</th>
                                    <th style="width:120px;">Size</th>
                                    <th style="width:180px;">Uploaded By</th>
                                    <th style="width:100px">Download</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                             <%=getWhileLoopData()%>

                            </tbody>
                           
                        </table>
                        </form>
                        <div class="pager" id="pager">
                            <form action="">
                                <div>
                                <img class="first" src="../css-admin/arrow-stop-180.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-stop-180.gif" alt="first"/>
                                <img class="prev" src="../css-admin/arrow-180.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-180.gif" alt="prev"/> 
                                <input type="text" class="pagedisplay input-short align-center"/>
                                <img class="next" src="../css-admin/arrow.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow.gif" alt="next"/>
                                <img class="last" src="../css-admin/arrow-stop.gif" tppabs="http://www.xooom.pl/work/magicadmin/images/arrow-stop.gif" alt="last"/> 

                                <select class="pagesize input-short align-center">
                                    <option value="10" selected="selected">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                </select>
                                </div>
                            </form>
                        </div>
                        
                        <div style="clear: both"></div>
                     </div> <!-- End .module-table-body -->
                </div> <!-- End .module -->
   
			</div>
		
	</div>
</asp:Content>