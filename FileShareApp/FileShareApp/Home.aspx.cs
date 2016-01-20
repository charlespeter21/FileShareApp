using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FileShareApp.Access;
using FileShareApp.Business;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
namespace FileShareApp
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             dbAccess obj = new dbAccess();
             SqlCommand com;
            string connstr = obj.ConnectionString.ToString();
            

            //SqlConnection con = new SqlConnection(connstr);

            //SqlCommand uploadCount = new SqlCommand("select count(File_Id) from UploadHistory",con);
        // string   str = "select count(File_Id) from UploadHistory;

          //  SqlDataReader reader = com.ExecuteReader();

           // reader.Read();
          ///  lblUpload.Text = reader["Name"].ToString();
           // reader.Read();



            SqlConnection con = new SqlConnection(connstr);
            con.Open();
            string str = "select count(File_Id) from UploadHistory";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();

            reader.Read();
            lblUpload.Text = reader[0].ToString();
           
        }

        //protected void Calendar2_SelectionChanged(System.Object sender, System.EventArgs e)
        //{
        //    TextBox1.Text = Convert.ToDateTime(Calendar2.SelectedDate, CultureInfo.GetCultureInfo("en-US")).ToString("MM/dd/yyyy");
        //}
    }
}