using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using FileShareApp.Access;
using FileShareApp.Business;
using CrystalDecisions.Shared;


namespace FileShareApp
{
    public partial class ReportUser : System.Web.UI.Page
    {
        dbAccess objDbAccess = new dbAccess();
        Report_Details objReports = new Report_Details();

        protected void Page_Load(object sender, EventArgs e)
        {

            CrystalReportViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;

            ReportDocument rptDoc = new ReportDocument();
            TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
            TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
           // Tables CrTables;

            crConnectionInfo.ServerName = objDbAccess.strServer;
            crConnectionInfo.DatabaseName = objDbAccess.strDbName;
            crConnectionInfo.UserID = objDbAccess.strUser;
            crConnectionInfo.Password = objDbAccess.strPassword;
            UserList ds = new UserList(); // .xsd file name
            DataTable dt = new DataTable();

            // Just set the name of data table
            dt.TableName = "Users";
           // dt = objReports.GetUserReports(); //This function is located below this function
           
            ds.Tables[0].Merge(dt);

            
            // Your .rpt file path will be below
            rptDoc.Load(Server.MapPath("~/Reports/ListUser.rpt"));

            foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in rptDoc.Database.Tables)
            {
                crtableLogoninfo = CrTable.LogOnInfo;
                crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                CrTable.ApplyLogOnInfo(crtableLogoninfo);
            }
          //  crtableLogoninfo.ConnectionInfo = crConnectionInfo;
            //set dataset to the report viewer.
            rptDoc.SetDataSource(ds);
            CrystalReportViewer1.ReportSource = rptDoc;
        }

        

        
    }
}