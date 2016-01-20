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

namespace FileShareApp.Admin
{
    public partial class ReportDownload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportViewer_DownloadFiles.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None;

            ReportDocument rptDoc = new ReportDocument();
            TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
            TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            // Tables CrTables;

            crConnectionInfo.ServerName = "ANITHRAJ";
            crConnectionInfo.DatabaseName = "FILESHARE";
            crConnectionInfo.UserID = "sa";
            crConnectionInfo.Password = "admin123";
            UserList ds = new UserList(); // .xsd file name
            DataTable dt = new DataTable();

            // Just set the name of data table
            dt.TableName = "DownloadHistory";
            dt = getAllOrders(); //This function is located below this function

            ds.Tables[0].Merge(dt);


            // Your .rpt file path will be below
            rptDoc.Load(Server.MapPath("~/Reports/ListDownload.rpt"));

            foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in rptDoc.Database.Tables)
            {
                crtableLogoninfo = CrTable.LogOnInfo;
                crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                CrTable.ApplyLogOnInfo(crtableLogoninfo);
            }
            //  crtableLogoninfo.ConnectionInfo = crConnectionInfo;
            //set dataset to the report viewer.
            rptDoc.SetDataSource(ds);
            CrystalReportViewer_DownloadFiles.ReportSource = rptDoc;
        }

        public DataTable getAllOrders()
        {

            //Connection string replace 'databaseservername' with your db server name
            string sqlCon = "User ID=sa;PWD=admin123; server=anithraj;INITIAL CATALOG=fileshare;" +
                                "Integrated Security=True;Connect Timeout=0";


            SqlConnection Con = new SqlConnection(sqlCon);
            SqlCommand cmd = new SqlCommand();
            DataSet ds = null;
            SqlDataAdapter adapter;
            try
            {
                Con.Open();
                //Stored procedure calling. It is already in sample db.
                cmd.CommandText = "sp_getdownloadhistory";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = Con;
                ds = new DataSet();
                adapter = new SqlDataAdapter(cmd);
                adapter.Fill(ds, "DownloadHistory");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                cmd.Dispose();
                if (Con.State != ConnectionState.Closed)
                    Con.Close();
            }
            return ds.Tables[0];
        }
    }
}