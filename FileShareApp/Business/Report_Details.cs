using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FileShareApp.Access;
using System.Data;

namespace FileShareApp.Business
{
    public class Report_Details
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        public DataTable GetUserReports()
        {
            dbAccess db = new dbAccess();
            ds = db.ExecuteDataSet("sp_getuserdetails ");
            dt = ds.Tables[0];
            return dt;
        }

        public DataTable GetFileReports()
        {
            dbAccess db = new dbAccess();
            ds = db.ExecuteDataSet("sp_FileDetailsReport");
            dt = ds.Tables[0];
            return dt;
        }

        public DataTable GetDownloadReports()
        {
            dbAccess db = new dbAccess();
            ds = db.ExecuteDataSet("sp_getdownloadhistory");
            dt = ds.Tables[0];
            return dt;
        }

        public DataTable GetUploadReports()
        {
            dbAccess db = new dbAccess();
            ds = db.ExecuteDataSet("sp_getuploadhistory");
            dt = ds.Tables[0];
            return dt;
        }

    }
}