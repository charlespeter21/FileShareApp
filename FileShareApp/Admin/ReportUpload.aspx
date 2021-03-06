﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportUpload.aspx.cs" Inherits="FileShareApp.Admin.ReportUpload" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.$my = {
            dlgCloseBtn: $('div.dlgCloseBtn')
        };

        $(document).ready(function () {
            enableDlgCloseBtn();
        });
        function enableDlgCloseBtn() {
            if ($my.dlgCloseBtn.css('visibility') === undefined) {
                $my.dlgCloseBtn = $('div.dlgCloseBtn');
            } else if ($my.dlgCloseBtn.css('visibility') !== 'visible') {
                $my.dlgCloseBtn.css('visibility', 'visible');
                return;
            }
            window.setTimeout(enableDlgCloseBtn, 333);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <CR:CrystalReportViewer ID="CrystalReportViewer_UploadList" runat="server" AutoDataBind="true"  BestFitPage="True"  HasCrystalLogo="False"
        DisplayStatusbar="true" HasSearchButton="True" HasRefreshButton="True"/>
    </div>
    </form>
</body>
</html>
