using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webfriends
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=asp.pdf");
            Response.TransmitFile(Server.MapPath("~/pdf/asp.pdf"));
            Response.End();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.AppendHeader("Content-Disposition", "attachment; filename=csharp.pdf");
            Response.TransmitFile(Server.MapPath("~/pdf/csharp.pdf"));
            Response.End();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.AppendHeader("Content-Disposition", "attachment; filename=java.pdf");
            Response.TransmitFile(Server.MapPath("~/pdf/java.pdf"));
            Response.End();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.AppendHeader("Content-Disposition", "attachment; filename=javascript.pdf");
            Response.TransmitFile(Server.MapPath("~/pdf/asp.pdf"));
            Response.End();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.AppendHeader("Content-Disposition", "attachment; filename=css.pdf");
            Response.TransmitFile(Server.MapPath("~/pdf/asp.pdf"));
            Response.End();
        }
    }
}