using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (LoginManager.IsLogin("ihcrm") == false)
        {
            Response.Redirect("~/Login.aspx?logid=1");
            return;
        }
        else
        {
            if (Request["m"] != null)
            {
                string _mid = "";
                _mid = Request["m"].ToString();
                if (_mid != null && _mid.Length > 30) { Response.Redirect("~/login.aspx"); Response.End(); }
                switch (_mid)
                {
                    case "inbox": panel1.Controls.Add(LoadControl("~/Module/ListItem.ascx")); return;
                    case "sent": panel1.Controls.Add(LoadControl("~/Module/ListItem.ascx")); return;
                    case "send": panel1.Controls.Add(LoadControl("~/Module/send.ascx")); return;
                    case "viewmessage": panel1.Controls.Add(LoadControl("~/Module/ViewMessage.ascx")); return;
                    case "deletedResive": panel1.Controls.Add(LoadControl("~/Module/ListItem.ascx")); return;
                    case "deletedSend": panel1.Controls.Add(LoadControl("~/Module/ListItem.ascx")); return;
                    case "exit": Response.Redirect("login.aspx?ref=exit"); return;
                   
                }
            }
            else
            {
                panel1.Controls.Add(LoadControl("~/Module/ListItem.ascx")); return;
            }
        }
    }
}