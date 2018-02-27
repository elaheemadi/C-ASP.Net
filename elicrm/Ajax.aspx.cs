using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ajax : System.Web.UI.Page
{
    [WebMethod]
    public static string DeleteRow(string rowid, string mod)
    {

        try
        {
            string ssss = string.Empty;
            using (IheariCrmEntities db = new IheariCrmEntities())
            {
                if(mod=="0"){
                    db.DeleteMes(rowid, false);
                }
                else{
                    db.DeleteMes(rowid, true);
                }
              
            }
            return "ok#";
        }
        catch
        {
            return "no#";
        }
    }
}