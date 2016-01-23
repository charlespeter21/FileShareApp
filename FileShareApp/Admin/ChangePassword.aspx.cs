﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace FileShareApp.Admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected FileShareApp.Business.ChangePasswordClient objClient = new Business.ChangePasswordClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChange_Click1(object sender, ImageClickEventArgs e)
        {
            DataSet ds = new DataSet();
            DataTable dtUserExist = new DataTable();
            DataTable dtUserDetails = new DataTable();

            objClient.User_Name = (Session["user"]).ToString();

            objClient.Current_Password = DESEncrypt(txtCurrentPassword.Text);
            ds = objClient.Load_User_Password_By_Id(objClient);
            dtUserExist = ds.Tables[0];
            if (dtUserExist.Rows[0][0].ToString() == "true")
            {
                objClient.New_Password = DESEncrypt(txtNewPassword.Text);
                objClient.Change_User_Password(objClient);
                dtUserDetails = ds.Tables[1];
                string email = dtUserDetails.Rows[0][2].ToString();

               // string email = objClient.Load_User_Current_Email_By_Id(objClient);
             /// string username = objClient.Load_User_Current_Username_By_Id(objClient);
                FileShareApp.Business.Email.sendMail("infoafocdubai@gmail.com", email, "", "", "AFOC File Portal Password Notification", "<pre><h1>AFOC File Portal Password Notification</h1><h3><br/><br/>Dear " + objClient.User_Name + ",<br/>        We have received a request from AFOC File Portal that you have changed the password for User in AFOC File Portal. We are sending your newly updated password along with this email. Please note the updated password for using the AFOC File Portal website.<br/><br/>        Your new password for AFOC File Portal is.<br/>        " + txtNewPassword.Text + "<br/><br/>        If you do not changed, kindly  inform us.<br/><br/> Thank You,<br/> afocfileapp.com <br/> P.O Box:6382,<br/> Abu Dhabi,<br/> United Arab Emirates <br/><br/>Request generated by: <br/> URL:<a href='http://www.afocfileapp.com'> http://www.afocfileapp.com </a></h3></pre>");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Success", "alert('Password Changed Successfully...please check your Email')", true);
                divLoginError.Visible = false;
                lblLoginSuccess.Text = "Password Successfully Changed.";
                divLoginSuccess.Visible = true;
            }
            else
            {
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Failed", "alert('Invalid current password')", true);
                divLoginSuccess.Visible = false;
                lblLoginError.Text = "Invalid current password.";
                divLoginError.Visible = true;
            }
        }


        /// <summary>
        /// code to Encrypt and Decrypt Password
        /// </summary>
        const string DESKey = "AQWSEDRF";
        const string DESIV = "HGFEDCBA";


        public static string DESDecrypt(string stringToDecrypt)//Decrypt the content
        {

            byte[] key;
            byte[] IV;

            byte[] inputByteArray;
            try
            {

                key = Convert2ByteArray(DESKey);

                IV = Convert2ByteArray(DESIV);

                int len = stringToDecrypt.Length; inputByteArray = Convert.FromBase64String(stringToDecrypt);


                DESCryptoServiceProvider des = new DESCryptoServiceProvider();

                MemoryStream ms = new MemoryStream(); CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);

                cs.FlushFinalBlock();

                Encoding encoding = Encoding.UTF8; return encoding.GetString(ms.ToArray());
            }

            catch (System.Exception ex)
            {

                throw ex;
            }





        }

        public static string DESEncrypt(string stringToEncrypt)// Encrypt the content
        {

            byte[] key;
            byte[] IV;

            byte[] inputByteArray;
            try
            {

                key = Convert2ByteArray(DESKey);

                IV = Convert2ByteArray(DESIV);

                inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();

                MemoryStream ms = new MemoryStream(); CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);

                cs.FlushFinalBlock();

                return Convert.ToBase64String(ms.ToArray());
            }

            catch (System.Exception ex)
            {

                throw ex;
            }

        }

        static byte[] Convert2ByteArray(string strInput)
        {

            int intCounter; char[] arrChar;
            arrChar = strInput.ToCharArray();

            byte[] arrByte = new byte[arrChar.Length];

            for (intCounter = 0; intCounter <= arrByte.Length - 1; intCounter++)
                arrByte[intCounter] = Convert.ToByte(arrChar[intCounter]);

            return arrByte;
        }
    }
}