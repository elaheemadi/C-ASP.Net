using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HtmlCleaner;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["ref"] == "exit") { DeleteCookie(); }
    }
    protected void CreateCookie(string val)
    {
        HttpCookie cookie = HttpContext.Current.Request.Cookies[LoginManager.EncodeTo64("ihcrm").Substring(1,7)];
        if (cookie == null)
        {
            HttpCookie cookie1 = new HttpCookie(LoginManager.EncodeTo64("ihcrm").Substring(1, 7), val);
            cookie1.Expires = DateTime.Now.AddHours(1);
            HttpContext.Current.Response.Cookies.Add(cookie1);
        }
        else
        {
            cookie.Expires = DateTime.Now.AddDays(-1);
            HttpCookie cookie1 = new HttpCookie(LoginManager.EncodeTo64("ihcrm").Substring(1, 7), val);
            cookie1.Expires = DateTime.Now.AddHours(1);
            HttpContext.Current.Response.Cookies.Add(cookie1);
        }
    }
    protected void DeleteCookie()
    {
        HttpCookie cookie = HttpContext.Current.Request.Cookies[LoginManager.EncodeTo64("ihcrm").Substring(1, 7)];
        if (cookie == null)
        {

        }
        else
        {
            cookie.Expires = DateTime.Now.AddDays(-10);
            Response.Cookies.Add(cookie);
        }
    }
    protected void btnlogin_Click(object sender, ImageClickEventArgs e)
    {
        string _u = txtusername.Text.ToSafeHtml();
        string _p = txtpassword.Text.ToSafeHtml();
        if (_u.Length == 0 || _p.Length == 0)
        {
            lblresult.Text = "You need to pin User and Password"; return;
        }
        else
        {
            using (IheariCrmEntities db=new IheariCrmEntities())
            {
                var lst=(from d in db.Member where d.UserName==_u && d.Password==_p select d).FirstOrDefault();
                if(lst !=null){
                    lst.IPAddress = Request.UserHostAddress.ToString();
                    lst.LastLogin = persiandate.Miladi2Shamsi(DateTime.Now).ToString() + " " + DateTime.Now.ToShortTimeString();
                    CreateCookie(LoginManager.EncryptData(lst.UserName));
                    Response.Redirect("Default.aspx");
                }
                else{
                    lblresult.Text= " invalid User name or Password  !";
                }
            }
        }
    }
}