using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using HtmlCleaner;
using EntityFramework.BulkInsert.Extensions;
using System.Drawing;
using System.Net;
public partial class Module_send : System.Web.UI.UserControl
{
    const int MaxTotalBytes = 104857600;// 1048576; // 1 MB
   
    long totalBytes;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Request["m"] == "send")
        {
            if (Request["er"] == "1") { lblresult.Text = "Sending Error"; lblresult.ForeColor = Color.Red; }
            if (!IsPostBack)
            {
                setuserpath();
                using (IheariCrmEntities db = new IheariCrmEntities())
                {
                    var lst = db.MemberList(1).ToList();
                    RadTileList1.DataSource = lst;
                    RadTileList1.DataBind();
                }


            }
        }

    }
    private void setuserpath()
    {

        string bid = LoginManager.MemberID("ihcrm").ToString();
        var folder = Server.MapPath("~/Portal/" + bid + "/upload");
        if (!Directory.Exists(folder))
        {
            Directory.CreateDirectory(folder);

        }
        string[] imagepath = { "~/Portal/" + bid + "/upload" };
        radeditor.ImageManager.UploadPaths = imagepath;
        radeditor.ImageManager.ViewPaths = imagepath;
        radeditor.ImageManager.UploadPaths = imagepath;
        radeditor.DocumentManager.UploadPaths = imagepath;
        radeditor.DocumentManager.ViewPaths = imagepath;
        radeditor.DocumentManager.DeletePaths = imagepath;
        radeditor.FlashManager.UploadPaths = imagepath;
        radeditor.FlashManager.ViewPaths = imagepath;
        radeditor.FlashManager.DeletePaths = imagepath;
        radeditor.MediaManager.ViewPaths = imagepath;
        radeditor.MediaManager.UploadPaths = imagepath;
        radeditor.MediaManager.DeletePaths = imagepath;

        radeditor.DocumentManager.MaxUploadFileSize = 2465792;
        radeditor.FlashManager.MaxUploadFileSize = 2465792;
        radeditor.MediaManager.MaxUploadFileSize = 2465792;
        radeditor.DocumentManager.SearchPatterns = new string[] { "*.doc", "*.txt", "*.docx", "*.xls", "*.xlsx", "*.pdf", "*.jpg", "*.jpeg", "*.eps", "*.zip" };
        //  RadEditor1.DocumentManager.SearchPatterns.. = new string[] { "*.doc", "*.txt", "*.docx", "*.xls", "*.xlsx", "*.pdf", "*.jpg", "*.jpeg", "*.eps", "*.zip" };


    }
    protected void SaveButton_Click(Object Src, EventArgs E)
    {

       // Output.Text = FreeTextBox1.Text;
    }
    private void AttachFiles(byte[] _file, Int64 size,string contentype,string mimetype,string filename,int messageid)
    {
        using (IheariCrmEntities db = new IheariCrmEntities())
        {
            AttachFiles obj = new AttachFiles();
            obj.MessageID = messageid;
            obj.ContentType = contentype;
            obj.SizeFiles = size;
            obj.MimeType = mimetype;
            obj.FileName = filename;
            obj.Filebinary = _file;
            
            db.AttachFiles.Add(obj);
            db.SaveChanges();
        }
    }
    private List<Telerik.Web.UI.UploadedFileInfo> uploadedFiles = new List<Telerik.Web.UI.UploadedFileInfo>();
    public List<Telerik.Web.UI.UploadedFileInfo> UploadedFiles
    {

        get { return uploadedFiles; }

        set { uploadedFiles = value; }

    }
    public void RadAsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
    {
       // BtnSubmit.Visible = false;
        RefreshButton.Visible = true;
        RadAsyncUpload1.Visible = false;

        var liItem = new HtmlGenericControl("li");
        liItem.InnerText = e.File.FileName;

        if (totalBytes < MaxTotalBytes)
        {
            // Total bytes limit has not been reached, accept the file
            e.IsValid = true;
            totalBytes += e.File.ContentLength;
            lblresult.Text = totalBytes.ToString();
        }
        else
        {
            // Limit reached, discard the file
            e.IsValid = false;
        }

        if (e.IsValid)
        {

            ValidFiles.Visible = true;
            ValidFilesList.Controls.AddAt(0, liItem);
            //Dim image As Byte()

        }
        else
        {

            InvalidFiles.Visible = true;
            InValidFilesList.Controls.AddAt(0, liItem);
        }

    }
    protected void RefreshButton_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Request.RawUrl);
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        int memberid = LoginManager.MemberID("ihcrm");
        string subject = WebUtility.HtmlEncode(txtsubject.Text);
        string shomarename = WebUtility.HtmlEncode(txtshomarename.Text);
        if (subject.Length == 0)
        {
            lblresult.Text = "Please Enter Subject"; lblresult.ForeColor = Color.Red; return;
        }
        string body = WebUtility.HtmlEncode(radeditor.Content);
        if (body.Length<1)
        {
            lblresult.Text = "The Body Text is Very Short"; lblresult.ForeColor = Color.Red; return;
        }
        if (totalBytes > MaxTotalBytes)
        {
            lblresult.Text = "Maximum file Size is 10 MB"; lblresult.ForeColor = Color.Red; return;

        }
        int messageid;
        using (var context = new IheariCrmEntities())
        {
            using (var db = context.Database.BeginTransaction())
            {
                try
                {
                    Message obj = new Message();
                    obj.MemberID = memberid;
                    obj.DateCreate = DateTime.Now.ToShortDateString()+" "+DateTime.Now.ToShortTimeString();
                    obj.Title = subject;
                    obj.TextBody = body;
                    obj.ShomareName = shomarename;
                    obj.IPAddress = Request.UserHostAddress.ToString();
                    obj.TrashBox = false;
                    if (totalBytes > 0)
                    {
                        obj.SizeAttach = totalBytes.ToString();
                        obj.ISattach = true;
                    }
                    else
                    {
                        obj.ISattach = false;
                    }
                    obj.ISattach = true;
                    context.Message.Add(obj);
                    messageid = obj.ID;

                    IList<RadTreeNode> nodeCollection = RadTileList1.CheckedNodes;
                    List<Send_Recive> Lst = new List<Send_Recive>();

                    int _c = 0;
                    foreach (RadTreeNode node in nodeCollection)
                    {
                        if (node.Nodes.Count == 0)
                        {
                            _c = _c + 1;
                            Lst.Add(new Send_Recive
                            {
                                MessegaeID = messageid,
                                Memeber_ReciveID = int.Parse(node.Value),
                                Visit=false,TrashBox=false
                            });
                        }
                    }
                    if (_c == 0)
                    {
                        lblresult.Text = "You Must Select the Reciver"; lblresult.ForeColor = Color.Red; return;
                    }
                    context.Send_Recive.AddRange(Lst);

                    foreach (UploadedFile file in RadAsyncUpload1.UploadedFiles)
                    {
                        UploadedFileInfo uploadedFileInfo = new UploadedFileInfo(file);
                        UploadedFiles.Add(uploadedFileInfo);
                        string fna = uploadedFileInfo.FileName;
                        Stream fileStream = file.InputStream;
                        byte[] attachmentBytes = new byte[fileStream.Length];
                        fileStream.Read(attachmentBytes, 0, Convert.ToInt32(fileStream.Length));
                        AttachFiles obj3 = new AttachFiles();
                        obj3.MessageID = messageid;
                        obj3.ContentType = uploadedFileInfo.ContentType;
                        obj3.SizeFiles = uploadedFileInfo.ContentLength;
                        obj3.MimeType = null;
                        obj3.FileName = uploadedFileInfo.FileName;
                        obj3.Filebinary = attachmentBytes;
                        
                        context.AttachFiles.Add(obj3);
                    }
                  
                    context.SaveChanges();
                    db.Commit();
                    Response.Redirect("Default.aspx?m=sent");
                }
                catch (Exception ex)
                {
                  db.Rollback();
                 
                  Elmah.ErrorSignal.FromCurrentContext().Raise(ex);
                  Response.Redirect("Default.aspx?m=send&er=1");
                }
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        lblresult.Text = totalBytes.ToString();
        return;
    }
 
}