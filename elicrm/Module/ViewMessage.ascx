<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewMessage.ascx.cs" Inherits="Module_ViewMessage" %>
<script src="js/scripts.js"></script>
<style>
 .send-box td{font-size:16px;direction:rtl;padding:3px}
    .col-list-1{width:3%}
    
</style>
<link href="css/StyleSheet.css" rel="stylesheet" />
    <table class="send-box">
        <tr class="tr"><td class="col col-list-3"><asp:Label  runat="server" ID="lblsubject" CssClass="lbltext"></asp:Label></td><td class="col col-list-2">Subject:</td ><td class="col col-list-1"><img src="images/addrbook.gif"/></td></tr>
        <tr class="tr"><td class="col col-list-3"><asp:Label  runat="server" ID="shomarename" CssClass="lbltext"></asp:Label></td><td class="col col-list-2">Number:</td ><td class="col col-list-1"><img src="images/addrbook.gif"/></td></tr>
        <tr class="tr"><td class="col col-list-3" style="text-align:right;padding-right:10px">
            <asp:Label  runat="server" ID="lblmember" CssClass="lbltext"></asp:Label>
            <asp:Literal runat="server" ID="ltrmemberlist"></asp:Literal>
      </td><td class="col col-list-2"><asp:Label runat="server" ID="caption"></asp:Label></td ><td class="col col-list-1"><img src="images/addrbook.gif"/></td></tr>
        <tr class="tr"><td class="col col-list-3"><asp:Label  runat="server" ID="lbldate" CssClass="lbltext"></asp:Label></td><td class="col col-list-2">Date:</td ><td class="col col-list-1"><img src="images/addrbook.gif"/></td></tr>

        <tr class="tr" runat="server" id="attachtr"><td class="col col-list-3">
            <table style="direction:rtl">
        <asp:Repeater runat="server" ID="rpt">
        <ItemTemplate>
            <tr><td style="width:70px;padding:3px">File name:</td><td  style="padding:3px"><a href="UploadPic/myfile.aspx?fID=<%#DataBinder.Eval(Container.DataItem, "ID")%>" <%#DataBinder.Eval(Container.DataItem, "ID")%>><%#DataBinder.Eval(Container.DataItem, "FileName")%></a></td><td style="width:40px">Size:</td><td><%#DataBinder.Eval(Container.DataItem, "SizeFiles")%>Byte</td></tr>
        </ItemTemplate>
</asp:Repeater>
                </table>
       </td><td class="col col-list-2">Attaches:</td><td class="col col-list-1"><img src="images/attch.gif"/></td></tr>

        <tr><td class="col col-list-3" style="height:300px;vertical-align:top;padding:5px;text-align:right">
            <hr />
            <asp:Literal runat="server" ID="ltr"></asp:Literal></td> <td class="col col-list-2">Body text:</td><td class="col col-list-1"></td></tr>
    </table>
