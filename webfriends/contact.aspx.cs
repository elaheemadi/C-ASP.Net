using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webfriends
{
    public partial class contact2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
            con.Open();

            SqlCommand crt = new SqlCommand("insert into Contact (Name,Email,Subject,Message)values(@Name,@Email,@Subject,@Message)", con);

            crt.Parameters.AddWithValue("Name", contactName.Text);
            crt.Parameters.AddWithValue("Email", contactEmail.Text);
            crt.Parameters.AddWithValue("Subject", contactSubject.Text);
            crt.Parameters.AddWithValue("Message", contactMessage.Text);

            crt.ExecuteNonQuery();

            con.Close();
            Response.Redirect("default.aspx");
        }
    }
}