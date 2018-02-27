<%@ Control Language="C#" AutoEventWireup="true" CodeFile="send.ascx.cs" Inherits="Module_send" ValidateRequestMode="Disabled" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<script src="js/scripts.js"></script>
<script type="text/javascript">
    function chekinputs(str) {
        $.blockUI({ message: '<h4 style="direction:rtl;font-family:tahoma;padding:5px">'+str+'</h4>', timeout: 2000 });

    }
    $(function () {
        //if (prodId == "deletedResive") { $('li.deleterecive').css("background-color", "#B6E5EB"); }
        //else if (prodId == "deletedSend") { $('li.deletesend').css("background-color", "#B6E5EB"); }
        //else if (prodId == "sent") { $('li.send').css("background-color", "#B6E5EB"); }
        //else if (prodId == "send") {

        //    $('li.newmail').css("background-color", "#B6E5EB");
        //}
        //else if (prodId == "inbox") { $('li.inbox').css("background-color", "#B6E5EB"); }
        $('input.btnsave').click(function () {
            if ($('.txtsubject').val() == "") { chekinputs("Please Enter Subject!"); return false; }
            var _CountChecked = 0;
            $("span.rtChecked").each(function () {

                _CountChecked = _CountChecked + 1;

            });
            if (_CountChecked == 0) {
                chekinputs("Please select the Reciver");
                return false;
            }
        });
    });
    var uploadsInProgress = 0;
    var MAX_TOTAL_BYTES = 10485760;
    var filesSize = new Array();
    var OVERSIZE_MESSAGE = "Maximum File Siza is 10MB";
    var isDuplicateFile = false;

    function OnFileSelected(sender, args) {

        for (var fileindex in sender._uploadedFiles) {
            if (sender._uploadedFiles[fileindex].fileInfo.FileName == args.get_fileName()) {
                isDuplicateFile = true;
            }
        }
        if (!uploadsInProgress) {
           // $("input.btnsave").attr("disabled", "disabled");

        }
        uploadsInProgress++;
    }

    function OnFilesUploaded(sender, args) {
        if (sender._uploadedFiles.length == 0) {
            filesSize = new Array();
            uploadsInProgress = 0;
            //$("input.btnsave").removeAttr("disabled");
        }
        if (uploadsInProgress > 0) {
            DecrementUploadsInProgress();
        }

    }

    function OnProgressUpdating(sender, args) {

        filesSize[args.get_data().fileName] = args.get_data().fileSize;

    }

    function OnFileUploadFailed(sender, args) {
        DecrementUploadsInProgress();
    }

    function OnFileUploaded(sender, args) {
        DecrementUploadsInProgress();
        var totalBytes = 0;
        var numberOfFiles = sender._uploadedFiles.length;

        //if (isDuplicateFile) {
        //    sender.deleteFileInputAt(numberOfFiles - 1);
        //    isDuplicateFile = false;
        //    sender.updateClientState();
        //    return;
        //}

        for (var index in filesSize) {
            totalBytes += filesSize[index];
        }
        if (totalBytes > MAX_TOTAL_BYTES) {
            sender.deleteFileInputAt(numberOfFiles - 1);
            sender.updateClientState();
            chekinputs(OVERSIZE_MESSAGE);
        }
    }

    function OnFileUploadRemoved(sender, args) {
        if (args.get_fileName() != null) {
            if (!isDuplicateFile) {
                delete filesSize[args.get_fileName()];
            }
        }
    }

    function DecrementUploadsInProgress() {
        uploadsInProgress--;
        if (!uploadsInProgress) {
           // $("input.btnsave").removeAttr("disabled");

        }
    }

</script>
<style>
    body{background-color:#899AB7}
    .send-box td{border:0px solid red }
   
</style>
<link href="css/StyleSheet.css" rel="stylesheet" />
<div class="payam" style="text-align:right;direction:rtl"></div>
<table class="send-box">
      
                <tr class="tr"><td class="col col-list-3" style="text-align:right"> 
                    <asp:Label  runat="server" ID="lblresult" CssClass="lblresult" ></asp:Label>
                    <asp:Button runat="server" ID="btnSend" CssClass="btn btnsave" OnClick="btnSend_Click" Text="Send"/>
                               </td><td class="col col-list-2"></td ><td class="col col-list-1">
                                   <h4> Recivers selection</h4>
                                  
                                                                     </td></tr>

        <tr class="tr"><td class="col col-list-3"></td><td class="col col-list-2"></td ><td class="tdmembers" rowspan="5">
            <div class="memberList">
    
      <telerik:RadTreeView  ID="RadTileList1" TriStateCheckBoxes="true" runat="server" DataFieldID="ID" DataFieldParentID="ParentId" DataTextField="MemberGroupName" DataValueField="memberid" CheckBoxes="True" CheckChildNodes="True" MultipleSelect="True" ForeColor="White">
                        <DataBindings>
                        <telerik:RadTreeNodeBinding Depth="1" Expanded="true" />
                        </DataBindings>
                        </telerik:RadTreeView>
    </div>
            
</td></tr>
        <tr class="tr">
            <td class="col col-list-3" style="text-align:right">
                  <asp:TextBox runat="server" CssClass="txtstyle3 txtshomarename" ID="txtshomarename" MaxLength="100" Width="20%"> </asp:TextBox>
                Number
                <asp:TextBox runat="server" CssClass="txtstyle3 txtsubject" ID="txtsubject" MaxLength="500"> </asp:TextBox>

               
     

      </td><td class="col col-list-2">Subject</td ></tr>

        <tr class="tr"><td class="col col-list-3">
         <div class="demo-container size-medium">
        <div class="qsf-demo-canvas">
            <h2>Attaching File</h2>
         <%--   <ul class="qsf-list qsf-list-info">
                <li>
                    <strong>Maximum File Siza is 10MB</strong> 
                </li>
                <li>
                    <strong>Aceptable file :jpg,png,pdf,zip,rar,doc,docx,xls,xlsx</strong>
                </li>
            </ul>--%>
 
            <telerik:RadAsyncUpload  runat="server" ID="RadAsyncUpload1" 
                ViewStateMode="Enabled" 
                AllowedFileExtensions="jpg,jpeg,png,gifوJPG,pdf,PDF,zip,rar,xls,xlsx,doc,docx" 
                TargetFolder="" MultipleFileSelection="Automatic"
                MaxFileSize="10485760" Skin="Silk" CssClass="uploader"  
                OnFileUploaded="RadAsyncUpload1_FileUploaded" 
                OnClientValidationFailed="validationFailed"
                 UploadedFilesRendering="BelowFileInput" 
                Localization-Remove="Delete"
                 Localization-Select="Select"
                OnClientFileSelected="OnFileSelected"
                           OnClientFileUploadFailed="OnFileUploadFailed"
                           OnClientFilesUploaded="OnFilesUploaded"
                           OnClientProgressUpdating="OnProgressUpdating"
                           OnClientFileUploaded="OnFileUploaded"
                           OnClientFileUploadRemoved="OnFileUploadRemoved"
                >
                <Localization Select="Select File" Cancel="Cancell" Remove="Delete" />

            </telerik:RadAsyncUpload>
            <div class="qsf-results">
                <asp:Panel ID="ValidFiles" Visible="false" runat="server" CssClass="qsf-success">
<%--                    <h3>Attach Successful.:</h3>--%>
                    <ul class="qsf-list" runat="server" id="ValidFilesList"></ul>
                </asp:Panel>
 
                <asp:Panel ID="InvalidFiles" Visible="false" runat="server" CssClass="qsf-error">
                    <h3>Attachment was not Successful:</h3>
                    <ul class="qsf-list ruError" runat="server" id="InValidFilesList">
                        <li>
                            <p class="ruErrorMessage">File size is more than 10MB</p>
                        </li>
                    </ul>
 
                </asp:Panel>
                <telerik:RadButton Skin="Silk" ID="RefreshButton" runat="server" OnClick="RefreshButton_Click" Visible="false" Text="Back"></telerik:RadButton>
            </div>
            <div class="qsf-decoration"></div>
        </div>
        <script type="text/javascript">
            //<![CDATA[
            Sys.Application.add_load(function () {
                demo.initialize();
            });
            //]]>
        </script>
    </div>
        </td><td class="col col-list-2">Attaches</td></tr>
        <tr><td class="col col-list-3" style="text-align:center"> 
          <%--   <FTB:FreeTextBox id="FreeTextBox1" 
				OnSaveClick="SaveButton_Click" 
				runat="Server" Text="" TextDirection="RightToLeft" Width="100%" Height="250px"/>--%>
            <telerik:RadEditor runat="server" ID="radeditor" style="width:98%;margin-left:7px">
                <CssFiles>
                    <telerik:EditorCssFile Value="~/css/EditorContentArea.css" />
                </CssFiles>
            </telerik:RadEditor>

            </td>
            <td class="col col-list-2">Body text</td>
     
            </tr>
             

    </table>
  
   
