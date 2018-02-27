using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Reflection;
using System.Web.Security;
using System.Security.Cryptography;
using HtmlCleaner;

/// <summary>
/// Summary description for Login
/// </summary>
public class LoginManager
{
    public static bool IsLogin(string Bname)
    {
        HttpCookie cookie = HttpContext.Current.Request.Cookies[LoginManager.EncodeTo64("ihcrm").Substring(1, 7)];
        if (cookie != null)
        {
            cookie.Expires = DateTime.Now.AddDays(-1);
            HttpCookie cookie1 = new HttpCookie(LoginManager.EncodeTo64("ihcrm").Substring(1, 7), cookie.Value);
            cookie1.Expires = DateTime.Now.AddHours(1);
            HttpContext.Current.Response.Cookies.Add(cookie1);
            return true;
        }
        else {
            return false;
        }
    }
    public static string MemberName(string Bname)
    {
        HttpCookie cookie = HttpContext.Current.Request.Cookies[LoginManager.EncodeTo64("ihcrm").Substring(1, 7)];
        if (cookie != null)
        {
            return LoginManager.DecryptString(cookie.Value.ToSafeHtml());
        }
        else
        {
            return "";
        }
    }
    public static int MemberID(string Bname)
    {
        int mid = 0;
        HttpCookie cookie = HttpContext.Current.Request.Cookies[LoginManager.EncodeTo64("ihcrm").Substring(1, 7)];
        if (cookie != null)
        {
            string _u = LoginManager.DecryptString(cookie.Value.ToSafeHtml());
            using (IheariCrmEntities db = new IheariCrmEntities())
            {

                var lst = (from d in db.Member
                           where d.UserName == _u

                           select new { d.ID}).FirstOrDefault(); ;
                mid = lst.ID;
            }
        }
        return mid;
    }
    public static string EncodeTo64(string toEncode)
    {
        var toEncodeAsBytes = Encoding.ASCII.GetBytes(toEncode+"jj4jj3me%$#dsddsf");
        var returnValue = System.Convert.ToBase64String(toEncodeAsBytes);
        return returnValue;
    }
    public static string DecodeFrom64(string encodeData)
    {

        var encodeDataAsBytes = System.Convert.FromBase64String(encodeData);
        var returnValue = Encoding.ASCII.GetString(encodeDataAsBytes);
        return returnValue;
    }
    const string passphrase = "$#765gvdo743dsj@^7fd3zs']"; 
    public static string EncryptData(string Message)
    {
        byte[] Results;
        System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
        MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
        byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(passphrase));
        TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
        TDESAlgorithm.Key = TDESKey;
        TDESAlgorithm.Mode = CipherMode.ECB;
        TDESAlgorithm.Padding = PaddingMode.PKCS7;
        byte[] DataToEncrypt = UTF8.GetBytes(Message);
        try
        {
            ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
            Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
        }
        finally
        {
            TDESAlgorithm.Clear();
            HashProvider.Clear();
        }
        return Convert.ToBase64String(Results);
    }
    public static string DecryptString(string Message)
    {
        byte[] Results;
        System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();
        MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
        byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(passphrase));
        TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();
        TDESAlgorithm.Key = TDESKey;
        TDESAlgorithm.Mode = CipherMode.ECB;
        TDESAlgorithm.Padding = PaddingMode.PKCS7;
        byte[] DataToDecrypt = Convert.FromBase64String(Message);
        try
        {
            ICryptoTransform Decryptor = TDESAlgorithm.CreateDecryptor();
            Results = Decryptor.TransformFinalBlock(DataToDecrypt, 0, DataToDecrypt.Length);
        }
        finally
        {
            TDESAlgorithm.Clear();
            HashProvider.Clear();
        }
        return UTF8.GetString(Results);
    }
  
}