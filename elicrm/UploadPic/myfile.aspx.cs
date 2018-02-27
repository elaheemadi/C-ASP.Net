using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class imageu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["fID"] != null)
        {
            string filename="";
            int id = Int32.Parse(Request.QueryString["fID"]);
            using (IheariCrmEntities db = new IheariCrmEntities())
            {
                var picu = (from d in db.AttachFiles
                            where d.ID == id
                            select new { d.ID, d.FileName,d.Filebinary,d.ContentType }).ToList();
                if (picu != null)
                {
                    filename=picu[0].FileName.Replace(" ","-");
                    Byte[] bytes = (Byte[])picu[0].Filebinary;

                    Response.Buffer = true;

                    Response.Charset = "";

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);

                   // Response.ContentType = "image/jpeg";
                    Response.ContentType = ContentType;

                    Response.AddHeader("content-disposition", "attachment;filename="

                    + filename);
                  

                    Response.BinaryWrite(bytes);

                    Response.Flush();

                    Response.End();

                }

            }

              
           

        }
    }
}