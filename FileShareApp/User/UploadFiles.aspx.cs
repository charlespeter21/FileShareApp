using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FileShareApp.Business;

namespace FileShareApp.User
{
    public partial class UploadFiles : System.Web.UI.Page
    {
        protected FileShareApp.Business.FileUpload obj = new FileShareApp.Business.FileUpload();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                obj.UserId = Convert.ToInt32(Session["userId"]);
                obj.FileName = FileUpload1.FileName;
                obj.FileSize = FileUpload1.FileContent.Length;
                //get file extension
                obj.Extension = obj.FileName.Substring(obj.FileName.LastIndexOf(".") + 1);
                string fileType = null;
                switch (obj.Extension)
                {
                    case "doc":
                        fileType = "application/vnd.ms-word";
                        break;
                    case "docx":
                        fileType = "application/vnd.ms-word";
                        break;
                    case "xls":
                        fileType = "application/vnd.ms-excel";
                        break;
                    case "xlsx":
                        fileType = "application/vnd.ms-excel";
                        break;
                    case "jpg":
                        fileType = "image/jpg";
                        break;
                    case "png":
                        fileType = "image/png";
                        break;
                    case "gif":
                        fileType = "image/gif";
                        break;
                    case "pdf":
                        fileType = "application/pdf";
                        break;

                    default:
                        fileType = "Unknown";
                        break;
                }
                obj.FileType = fileType.ToString();
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/" + obj.FileName.Trim()));
                obj.FilePath = "~/Upload/" + obj.FileName.Trim();

                //set the file type based on File Extension



                obj.INSERT_File_DETAILS(obj);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('The file has been uploaded.')", true);
            }
        }
    }
}