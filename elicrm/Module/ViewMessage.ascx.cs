using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Module_ViewMessage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["ref"] == "res")
        {
            caption.Text = "Sender";
            int memberid = LoginManager.MemberID("ihcrm");
            Int64 rowid = Int64.Parse(Request["mesid"]);
            int mesid = 0;
            if (!IsPostBack)
            {
                using (IheariCrmEntities db = new IheariCrmEntities())
                {
                    var lst = (from d in db.Send_Recive where d.ID == rowid && d.Memeber_ReciveID == memberid select new {d.Visit, d.Message.Title, d.Message.ShomareName, d.MessegaeID, d.Message.TextBody, d.Message.DateCreate, d.Message.Member.DisplayName }).FirstOrDefault();
                    if (lst != null)
                    {
                        lblsubject.Text = lst.Title;
                        ltr.Text = WebUtility.HtmlDecode(lst.TextBody);
                        lbldate.Text = lst.DateCreate;
                        lblmember.Text = lst.DisplayName;
                        shomarename.Text = lst.ShomareName;
                        mesid = lst.MessegaeID;

                        if (lst.Visit == false)
                        {
                            var ff = (from d in db.Send_Recive where d.ID == rowid select d).FirstOrDefault();
                            ff.Visit = true;
                            ff.DateView = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
                            ff.IPAddress = Request.UserHostAddress.ToString();
                            db.SaveChanges();
                        }


                        var lst2 = (from d in db.AttachFiles where d.MessageID == mesid select new { d.ID, d.FileName, d.SizeFiles }).ToList();
                        if (lst2.Count > 0)
                        {
                            rpt.DataSource = lst2;
                            rpt.DataBind();
                        }
                        else { attachtr.Visible = false; }
                    }
                    else
                    {
                        Response.Redirect("Default.aspx?ref=er");
                    }
                }
            }
        }



        if (Request["ref"] == "send")
        {
            caption.Text = "Recivers:";
            int memberid = LoginManager.MemberID("ihcrm");
            Int64 rowid = Int64.Parse(Request["mesid"]);
            int mesid = 0;
            if (!IsPostBack)
            {
                using (IheariCrmEntities db = new IheariCrmEntities())
                {
                    var lst = (from d in db.Message where d.ID == rowid && d.MemberID == memberid select new { d.ID,d.Title, d.ShomareName, d.TextBody, d.DateCreate, d.Member.DisplayName }).FirstOrDefault();
                    if (lst != null)
                    {
                        lblsubject.Text = lst.Title;
                        ltr.Text = WebUtility.HtmlDecode(lst.TextBody);
                        lbldate.Text = lst.DateCreate;
                        lblmember.Text = lst.DisplayName;
                        shomarename.Text = lst.ShomareName;
                        mesid = lst.ID;
                        
                        var memberlist = (from d in db.Send_Recive where d.MessegaeID==rowid select new { d.ID,d.Visit,d.Member.DisplayName,d.DateView}).ToList();
                        string _memberlist = "";
                        if (memberlist.Count > 0)
                        {
                            lblmember.Visible = false;
                            foreach (var item in memberlist)
                            {
                                _memberlist = _memberlist + "<label title='" + item.DateView + "' class='memberResiver  visit" + item.Visit + "'>(" + item.DisplayName + ")</label>"+ "     ";
                            }
                            ltrmemberlist.Text = _memberlist;
                        }

                        var lst2 = (from d in db.AttachFiles where d.MessageID == mesid select new { d.ID, d.FileName, d.SizeFiles }).ToList();
                        if (lst2.Count > 0)
                        {
                            rpt.DataSource = lst2;
                            rpt.DataBind();
                        }
                        else { attachtr.Visible = false; }
                    }
                    else
                    {
                        Response.Redirect("Default.aspx?ref=er");
                    }
                }
            }
        }
    }
}