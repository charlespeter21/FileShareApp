using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FileShareApp
{
    public partial class AdminHeader : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin();
        }
        private void CheckLogin()
        {
            string domain = Request.Url.Authority.ToString();
            //BaseURL = "http://" + domain + "/";
            //Load menu or Do Any database related work
            if (Session["user"] == null)
            {
                Response.Redirect("../Index.aspx", false);
            }
        }
    }
}