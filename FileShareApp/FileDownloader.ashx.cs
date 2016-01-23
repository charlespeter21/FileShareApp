using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using FileShareApp.Business;
using FileShareApp.Access;

namespace FileShareApp
{
    /// <summary>
    /// Summary description for FileDownloader
    /// </summary>
    public class FileDownloader : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {
        protected FileShareApp.Business.FileUpload obj = new FileShareApp.Business.FileUpload();
        public void ProcessRequest(HttpContext context)
        {
           
            //HttpFileCollection files = context.Request.Files;
           
            string file = context.Request.QueryString["file"];
            int id = Convert.ToInt32(context.Request.QueryString["id"]);
            obj.FileId = id;
            obj.UserId = Convert.ToInt32(context.Session["userId"]);
            string folder = "/uploads/";
            string fileWithFolder=folder+ file;

            if (!string.IsNullOrEmpty(file) && File.Exists(context.Server.MapPath(fileWithFolder)))
                {
                    //<span class="skimlinks-unlinked">context.Response.Clear</span>();
                    context.Response.ContentType = "application/octet-stream";
                    //I have set the ContentType to "application/octet-stream" which cover any type of file
                    context.Response.AddHeader("content-disposition", "attachment;filename=" + Path.GetFileName(file));
                    context.Response.WriteFile(context.Server.MapPath(fileWithFolder));
                    //here you can do some statistic or tracking
                    //you can also implement other business request such as delete the file after download
                    //<span class="skimlinks-unlinked">context.Response.End</span>();
                /// call function to download
                    obj.Downlaod_File(obj);
                }
                else
                {
                    context.Response.ContentType = "text/plain";
                    //<span class="skimlinks-unlinked">context.Response.Write("File</span>ot be found!");
                }

              






















           
                //System.Threading.Thread.Sleep(1000);
                //HttpPostedFile files = files[i];
                //string filename = context.Server.MapPath("~/Uploads/" + System.IO.Path.GetFileName(files.FileName));
                //context.Response.Clear();
                //context.Response.ContentType = "application/octet-stream";
                //context.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ";");
                //context.Response.WriteFile(context.Server.MapPath("~/Uploads/"+filename));
                //context.Response.End();
          
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}