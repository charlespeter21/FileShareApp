using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FileShareApp.Access;
using FileShareApp.Business;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace FileShareApp.Admin
{
    public partial class ReportUploadDetails : System.Web.UI.Page
    {
        dbAccess objDbAccess = new dbAccess();
        Report_Details objReports = new Report_Details();
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void btnShowReport_Click(object sender, EventArgs e)
        {
            objReports.FromDate = Convert.ToDateTime(txtFromdateUpload.Text);
            objReports.ToDate = Convert.ToDateTime(txtTodateUpload.Text);
            objReports.FileName = ddlUsers.SelectedItem.Text;
            ShowReport();
        }

        private void ShowReport()
        {

            //Reset
            rptListUpload.Reset();

            // Data Source
            DataTable dt = new DataTable();
            dt.TableName = "UploadFile";
            dt = objReports.GetFileReports(objReports);
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            rptListUpload.LocalReport.DataSources.Add(rds);

            //Path
            rptListUpload.LocalReport.ReportPath = "ListAllUpload.rdlc";
            //Parameters
            // List<ReportParameter> myParams = new List<ReportParameter>();


            ReportParameter[] rptParams = new ReportParameter[3];

            rptParams[0] = new ReportParameter("FromDate", txtFromdateUpload.Text);
            rptParams[1] = new ReportParameter("ToDate", txtTodateUpload.Text);
            //if (txtFileName.Text == "")
            //{
            //    rptParams[2] = new ReportParameter("FileName", new string[] { null });
            //}
            //else
            {
                rptParams[2] = new ReportParameter("FileName", ddlUsers.SelectedItem.Text);
            }


            rptListUpload.LocalReport.SetParameters(rptParams);
            //Refesh

            rptListUpload.LocalReport.Refresh();
            // Just set the name of data table


        }

        protected void ddlUsers_DataBinding(object sender, EventArgs e)
        {
            ddlUsers.Items.Add(new ListItem("All", "all"));
            ddlUsers.SelectedIndex = -1; ;
        }
    }
}