<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FileShareApp.Index1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <title>AFOC - Armed Forces Officers Club & Hotel</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="fileportal,afoc,AFOC,Armed Forces, Armed,Officers, Club & hotel" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" type="image/x-icon" href="logo/logo1.ico"/> 
      
        
        <link rel="stylesheet" type="text/css" href="Loginstyle/css/style.css" />
		<script src="Loginstyle/js/modernizr.custom.63321.js"></script>

        <!--B Validator-->
        <script type="text/javascript" src="Validator/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="Validator/jquery.bvalidator.js"></script>
        <script type="text/javascript" src="Validator/jquery.bvalidator-yc.js"></script>
        <link href="Validator/bvalidator.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript">
            $('#myform').bValidator();
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#myform').bValidator();
            });
</script>

<script src="js/rightClick.js" type="text/javascript"></script>

<%--<script type="text/javascript" language="javascript">
    document.onmousedown = disableclick;
   // status = "";
    function disableclick(event) {
        if (event.button == 2) {
           // alert(status);
            return false;
        }
    }
</script>--%>
<%--<style type="text/css">
    element.style {
    visibility: visible;
    position: absolute;
    top: -72px;
    left: 30px;
    display: block;
}
</style>--%>

		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
    <body>
        <div class="container">
		
          <span> <asp:Image ID="Image1" runat="server" ImageUrl="~/css-admin/front.jpg"  Width="1349px" Height="140px" /> </span> 
			
			<header>
			
				<h1><strong style=" color:#082642; font-family:Arabic Transparent;">FILE SHARE PORTAL</strong> </h1>
				<h2>Hi User, Welcome to the webportal, Share your files on a single click...</h2>
	
			</header>
			
			<section class="main">
				<form class="form-1"  id="myform" runat="server">
					<p class="field">
						<input type="text" id="txtLogin" name="login" runat="server" placeholder="Username or email" data-bvalidator="required" data-bvalidator-msg="Please Enter Username"/>
						<i class="icon-user icon-large"></i>
					</p>
						<p class="field">
							<input type="password" id="txtPassword" name="password" runat="server" placeholder="Password" data-bvalidator="required" data-bvalidator-msg="Please Enter Password" />
							<i class="icon-lock icon-large"></i>
					</p>
					<p class="submit">
                 
                    <asp:ImageButton ID="btnlogin" runat="server" CausesValidation="true" 
                            ImageUrl="~/Loginstyle/images/01.png"   
                            onmouseover="javascript:this.src='../Loginstyle/images/02.png'" 
                            onmouseout="javascript:this.src='../Loginstyle/images/01.png'" 
                            onclick="btnlogin_Click"  ></asp:ImageButton>
						<%--<button id="btnlogin" type="submit" name="submit" runat="server" onclick=""  ><i class="icon-arrow-right icon-large"></i></button>--%>
					</p>
                    	<p id="err" runat="server" visible="false" style="color:Red;  font-size:medium; font-weight:bold" >
                    Incorrect Username/Password
                    
                    </p>
				</form>
			</section>
        </div>
    </body>
</html>
