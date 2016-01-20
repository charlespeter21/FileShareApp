using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using FileShareApp.Access;
using System.Data;
using System.Text;

namespace FileShareApp.User
{
    public partial class ListFiles : System.Web.UI.Page
    {
        protected FileShareApp.Business.FileUpload obj = new FileShareApp.Business.FileUpload();
        public bool Search = false;
        public string key;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public StringBuilder getWhileLoopData()
        {
            StringBuilder htmlStr = new StringBuilder();
            //dbAccess obj = new dbAccess();
            //string connstr = obj.ConnectionString.ToString();
            DataSet ds = new DataSet();
            //SqlCommand cmdSearch= new SqlCommand();
            //SqlConnection con = new SqlConnection(connstr);
            if (!Search)
            {
                // cmdSearch = new SqlCommand("Select FileID,FileName,FileExtension,FileSize from UploadFile", con);
                ds = obj.Get_Files_List();
            }
            else
            {
                //cmdSearch = new SqlCommand("Select FileID,FileName,FileExtension,FileSize from UploadFile where FileName like '%" + key + "%'", con);
                ds = obj.Get_Files_Search(key);

            }
            //SqlDataAdapter da = new SqlDataAdapter();
            //con.Open();

            //SqlDataReader reader = cmdSearch.ExecuteReader();

            DataTable dt = new DataTable();
            if (ds.Tables.Count > 0)
            {
                dt = ds.Tables[0];
                //con.Open();
                //dt.Load(cmdSearch.ExecuteReader());
                //if (Search)
                //{
                if (dt.Rows.Count == 0 || ds.Tables.Count == 0)
                {
                    htmlStr.Append("<tr><td class=" + "'align-center'" + " colspan=6>No Data Found</td></tr>");
                    //  ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Sorry No Records Found with this Keyword.....');document.location.href='Home.aspx';", true);

                }
                //}
                else
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        int id = Convert.ToInt32(dr[0].ToString());
                        string Name = dr[1].ToString();
                        string Pass = dr[2].ToString();
                        int size = Convert.ToInt32(dr[4].ToString());
                        string user = dr[3].ToString();
                        htmlStr.Append("<tr><td class=" + "'align-center'" + ">" + id + "</td><td>" + Name + "</td><td>" + Pass + "</td><td>" + size + "</td><td>" + user + "</td><td><a href='../FileDownloader.ashx?file=" + Name + "&id=" + id + "' target='_blank' >Download</a></td></tr>");
                    }
                }
            }
            //while (reader.Read())
            //{
            //    int id = reader.GetInt32(0);
            //    string Name = reader.GetString(1);
            //    string Pass = reader.GetString(3);
            //    htmlStr += "<tr><td class="+"'align-center'"+">" + id + "</td><td>" + Name + "</td><td>" + Pass + "</td></tr>";
            //}

            //con.Close();
            return htmlStr;
        }

        protected void btnsearch_Click(object sender, ImageClickEventArgs e)
        {
            key = txtsearch.Text;
            Search = true;
            getWhileLoopData();
            // StringBuilder htmlStr = new StringBuilder();
            // dbAccess obj = new dbAccess();
            // string connstr = obj.ConnectionString.ToString();


            // SqlConnection con = new SqlConnection(connstr);


            // //SqlDataAdapter da = new SqlDataAdapter();
            // DataTable dt = new DataTable();
            // con.Open();
            // dt.Load(cmdSearch.ExecuteReader());
            // //da.Fill(dt);
            //// con.Close();

            // else
            // {
            //     foreach (DataRow dr in dt.Rows)
            //     {
            //         int id = Convert.ToInt32(dr[0].ToString());
            //         string Name = dr[1].ToString();
            //         string Pass = dr[2].ToString();
            //         int size = Convert.ToInt32(dr[3].ToString());
            //         htmlStr.Append("<tr><td class=" + "'align-center'" + ">" + id + "</td><td>" + Name + "</td><td>" + Pass + "</td><td>" + size + "</td></tr>");
            //     }
            //     con.Close();
            //     return htmlStr;
            // }

        }
    }
}