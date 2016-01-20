<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserHeader.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FileShareApp.User.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/chart.min.js"></script>
    <script type="text/javascript" src="../js/chart-data.js"></script>
    <script type="text/javascript" src="../js/easypiechart.js"></script>
    <script type="text/javascript" src="../js/easypiechart-data.js"></script>
    <script type="text/javascript" src="../js/bootstrap-datepicker.js"></script>
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


<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <form role="search">
        <div class="form-group" style="padding-bottom:50px;">
            <%--<input type="text" class="form-control" placeholder="Search">--%>
        </div>
        </form>
        <ul class="nav menu">
            <li class="active"><a href="AdminHome.aspx">
                <svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg>
                Dashboard</a></li>
            <li><a href="ListFiles.aspx">
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
        <%--<div class="row">
            <ol class="breadcrumb">
                <li><a href="#">
                    <svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg>
                </a></li>
                <li class="active">Icons</li>
            </ol>
        </div>--%>
        <!--/.row-->
        <div class="row" style="padding-top:20px;">
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
                            <svg class="glyph stroked upload"><use xlink:href="#stroked-upload"/></svg>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large">
                                <asp:Label ID="lblUpload" runat="server" Font-Size="35px" Font-Bold="true" Font-Names="Gabriola"></asp:Label></div>
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
                            <svg class="glyph stroked download"><use xlink:href="#stroked-download"/></svg>
                        </div>
                        <div class="col-sm-9 col-lg-7 widget-right">
                            <div class="large">
                                <asp:Label ID="lblDownload" runat="server" Font-Size="35px" Font-Bold="true" Font-Names="Gabriola"></asp:Label></div>
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
                                <asp:Label ID="lblUsers" runat="server" Font-Size="45px" Font-Bold="true" Font-Names="Gabriola"></asp:Label></div>
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
                            <svg class="glyph stroked eye"><use xlink:href="#stroked-eye"/></svg>
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
        </div>
        </div>

</asp:Content>
