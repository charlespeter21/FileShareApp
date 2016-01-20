<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FileShareApp.Index" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">

 <style type="text/css">
        #fade { /*--Transparent background layer--*/
	display: none; /*--hidden by default--*/
	background: #000;
	position: fixed; left: 0; top: 0;
	width: 100%; height: 100%;
	opacity: .80;
	z-index: 9999;
}
.popup_block{
	display: none; /*--hidden by default--*/
	background: #fff;
	padding: 20px;
	border: 20px solid #ddd;
	float: left;
	font-size: 1.2em;
	position: fixed;
	top: 50%; left: 50%;
	z-index: 99999;
	/*--CSS3 Box Shadows--*/
	-webkit-box-shadow: 0px 0px 20px #000;
	-moz-box-shadow: 0px 0px 20px #000;
	box-shadow: 0px 0px 20px #000;
	/*--CSS3 Rounded Corners--*/
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
img.btn_close {
	
	padding-left:500px;
	margin: -55px -55px 0 0;
	border:0px none;
}
/*--Making IE6 Understand Fixed Positioning--*/
*html #fade {
	position: absolute;
}
*html .popup_block {
	position: absolute;
}
    </style>  

 <style type="text/css">
        .modalBackground
{
      background-color: Black;
      filter: alpha(opacity=60);
      opacity: 0.6;
}
 
.modalPopup
{
      background-color:#918f8f;
      border-width:3px;
      border-style:solid;
      border-color:Gray;
      padding-left:7px;
      padding-right:5px;
      padding-bottom:5px;
      padding-top:5px;
      width: 505px;
      height:auto;
    
}
    </style>




  

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <!--Icons-->
    <script src="js/lumino.glyphs.js"></script>
    <!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body runat="server">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>Armed Forces Officers Club & Hotel</span>&nbsp; &nbsp;File Share Portal</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> User <%--<span class="caret"></span>--%></a>
						<%--<ul class="dropdown-menu" role="menu">
					    <li><a href="#"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul>--%>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
        </form>
        <ul class="nav menu">
            <li class="active"><a href="Home.aspx">
                <svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg>
                Dashboard</a></li>
            <li><a href="ListFiles.aspx">
                <svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>
                Files</a></li>
            <li><a href="UploadFiles.aspx">
                <svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg>
                New Uploads</a></li>
            <li><a href="Index.aspx">
                <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                Logout</a></li>
        </ul>
    </div>
    <!--/.sidebar-->
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#">
                    <svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg>
                </a></li>
                <li class="active">Icons</li>
            </ol>
        </div>
        <!--/.row-->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Dashboard</h1>
            </div>
        </div>
        <!--/.row-->
        <div class="row">
            <div class="col-xs-12 col-md-6 col-lg-3">
                <div class="panel panel-blue panel-widget ">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large">
                                <asp:Label ID="lblUpload" runat="server"></asp:Label></div>
                            <div class="text-muted">
                                Uploads</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3">
                <div class="panel panel-orange panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <svg class="glyph stroked empty-message"><use xlink:href="#stroked-empty-message"></use></svg>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large">
                                12</div>
                            <div class="text-muted">
                                Downloads</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3">
                <div class="panel panel-teal panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large">
                                2</div>
                            <div class="text-muted">
                                Users</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-6 col-lg-3">
                <div class="panel panel-red panel-widget">
                    <div class="row no-padding">
                        <div class="col-sm-3 col-lg-5 widget-left">
                            <svg class="glyph stroked app-window-with-content"><use xlink:href="#stroked-app-window-with-content"></use></svg>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large">
                                <a href="http://www.freecounterstat.com" title="web page counter">
                                    <img src="http://counter1.fcs.ovh/private/freecounterstat.php?c=4e651204fd3b05be6f7acbab439ce095"
                                        border="0" title="web page counter" alt="web page counter"></a></div>
                            <div class="text-muted">
                                Page Visit</div>
                        </div>
                    </div>
                </div>
            </div>
            <form runat="server">
            <asp:Button ID="btndum" runat="server" Text="Button"  />
        </div>
        <!--/.row-->
        <!--/.row-->
        <!--/.row-->
        <!--/.row-->
        <ajaxToolkit:ModalPopupExtender ID="Login_ModalPopupExtender" runat="server" TargetControlID="btndum" CancelControlID="btnCloseRoles" PopupControlID="pnlpopup" BackgroundCssClass="modalBackground">
    </ajaxToolkit:ModalPopupExtender>

    <div id="login-box">
        <asp:Panel ID="pnlpopup" runat="server" CssClass="login-popup" Width="300px">
        
                
        
            
        <div class="textbox" style="width:300px; height:auto; font-family:Arial; font-size:12px; color:White; padding:20px;-moz-border-radius:10px;	-webkit-border-radius:10px;	 border-radius:10px; border:3px #31a3c6 solid; background-color:#b4eeff;">
             
        <asp:LinkButton ID="btnCloseRoles" runat="server" style="float:right; margin-top:-20px; margin-right:20px;">
        <img src="css-admin/close.png" style="border:none;" class="btnclose" title="Close Window" alt="Close" />
        </asp:LinkButton>
          
            <table style="color:#4b4b4b;">
        <tr><td colspan="2"><div style="text-align:center; font-size:16px; padding:7px; ">View Report</div></td></tr>
        <tr><td><div style="padding:7px;">FromDate</div></td>
        <td><asp:TextBox ID="FromDate" runat="server" ForeColor="Red" />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/css-admin/calendar.png" />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" 
                TargetControlID="FromDate" PopupButtonID="Image1">
            </ajaxToolkit:CalendarExtender></td></tr>

        <tr><td></td><td><div id="divEnterUsername" runat="server" style="display:none; color:Red;">Please Select From Date</div></td></tr>
        <tr><td><div style="padding:7px;">ToDate:</div></td>
        <td><asp:TextBox ID="ToDate" runat="server"  ForeColor="Red"  />
            <asp:Image ID="Image2" runat="server" ImageUrl="~/css-admin/calendar.png" />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                TargetControlID="ToDate" PopupButtonID="Image2">
            </ajaxToolkit:CalendarExtender></td></tr>
        <tr><td></td><td><div id="divEnterPassword" runat="server" style="display:none; color:Red;">Please Select To Date</div></td></tr>

        <tr><td><div style="padding:7px;">FileName:</div></td>
        <td><asp:TextBox ID="TxtFileName" runat="server" ForeColor="Red"></asp:TextBox></td></tr>
       <%-- <tr><td></td><td><div id="div1" runat="server" style="display:none; color:Red;">Please Select To Date</div></td></tr>--%>
        
        <tr><td></td><td> 
                <div id="divLoginError" runat="server" style="color:Red; text-align:left; padding:7px; float:left; width:100%;" ><asp:Label ID="lblLoginError" runat="server"></asp:Label></div>
                </td></tr>
        <tr><td></td><td><div style="float:right; margin-top:10px;">
        <asp:ImageButton ID="ImgBtnViewReport" runat="server" 
                ImageUrl="~/css-admin/Go.jpg" Width="70px" 
                /></div></td></tr>
        
        
        
        </table>

     
        </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        
        </asp:Panel>

     </div>
    <!--/.main-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/chart.min.js"></script>
    <script src="js/chart-data.js"></script>
  <%--  <script src="js/easypiechart.js"></script>--%>
    <%--<script src="js/easypiechart-data.js"></script>--%>
    <script src="js/bootstrap-datepicker.js"></script>
    <script>
        $('#calendar').datepicker({
    });

    !function ($) {
        $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    } (window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
    </script>
    <script type="text/javascript" src="http://counter1.fcs.ovh/private/counter.js?c=fa58ab173229a918ea05744c9272e2b2"></script>
</body>
</html>
