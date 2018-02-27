using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Module_ListItem : System.Web.UI.UserControl
{
    public string caption;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        int memberid = LoginManager.MemberID("ihcrm");
        if (Request["m"] == "inbox")
        {
            caption = "Sender";
            using (IheariCrmEntities db = new IheariCrmEntities())
            {
                var lst = (from d in db.Send_Recive orderby d.ID descending where d.Memeber_ReciveID==memberid && d.TrashBox==false select new {d.Message.ISattach, d.ID,d.Message.Member.DisplayName,d.Message.Title,d.Message.DateCreate,d.Visit,d.Message.SizeAttach,d.Message.AttachFiles,d.Message.ShomareName }).ToList();
                rptresive.DataSource = lst;
                rptresive.DataBind();
                rptsent.Visible = false;
                rptresive.Visible = true ;
            }
        }
        else  if (Request["m"] == "sent")
        {
           
            caption = "To";
            using (IheariCrmEntities db = new IheariCrmEntities())
            {
                var lst = (from d in db.Message orderby d.ID descending where d.MemberID == memberid && d.TrashBox == false select new { d.ISattach, d.ID, d.Title, d.DateCreate, d.SizeAttach, d.AttachFiles, d.ShomareName }).ToList();
                rptsent.DataSource = lst;
                rptsent.DataBind();
                rptsent.Visible = true;
                rptresive.Visible = false;

            }
        }
        else if (Request["m"] == "deletedSend")
        {
           
            caption = "TO";
            using (IheariCrmEntities db = new IheariCrmEntities())
            {
                var lst = (from d in db.Message orderby d.ID descending where d.MemberID == memberid && d.TrashBox == true select new { d.ISattach, d.ID, d.Title, d.DateCreate, d.SizeAttach, d.AttachFiles, d.ShomareName }).ToList();
                rptsent.DataSource = lst;
                rptsent.DataBind();
                rptsent.Visible = true;
                rptresive.Visible = false;

            }
        }
            
        else if (Request["m"] == "deletedResive")
        {
            caption = "Sender";
            using (IheariCrmEntities db = new IheariCrmEntities())
            {
                var lst = (from d in db.Send_Recive orderby d.ID descending where d.Memeber_ReciveID == memberid && d.TrashBox == true select new { d.Message.ISattach, d.ID, d.Message.Member.DisplayName, d.Message.Title, d.Message.DateCreate, d.Visit, d.Message.SizeAttach, d.Message.AttachFiles, d.Message.ShomareName }).ToList();
                rptresive.DataSource = lst;
                rptresive.DataBind();
                rptsent.Visible = false;
                rptresive.Visible = true;
            }
        }
        else {
            caption = "Sender";
            using (IheariCrmEntities db = new IheariCrmEntities())
            {
                var lst = (from d in db.Send_Recive orderby d.ID descending where d.Memeber_ReciveID == memberid select new {d.Message.ISattach, d.ID, d.Message.Member.DisplayName, d.Message.Title, d.Message.DateCreate, d.Message.SizeAttach,d.Visit, d.Message.AttachFiles, d.Message.ShomareName }).ToList();
                rptresive.DataSource = lst;
                rptresive.DataBind();
                rptsent.Visible = false;
                rptresive.Visible = true;

            }
        }
       
            
    }
}