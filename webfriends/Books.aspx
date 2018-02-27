<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="webfriends.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/table.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
 <div class="table-title">
<h3>Books Table</h3>
</div>
<table class="table-fill">
<thead>
<tr>
<th class="text-left">Name</th>
<th class="text-left">Size</th>
    <th class="text-left">Select</th>
</tr>
</thead>
<tbody class="table-hover">
<tr>
<td class="text-left">Asp.net</td>
<td class="text-left">4M</td>
 <td class="text-center">
<asp:Button ID="Button1" runat="server" Text="Download" OnClick="Button1_Click" />
     
   
    </td>
</tr>
<tr>
<td class="text-left">C#</td>

<td class="text-left">2M</td>
 <td class="text-center">
<asp:Button ID="Button2" runat="server" Text="Download" OnClick="Button2_Click" />
   
    </td>
</tr>
<tr>
<td class="text-left">JAVA</td>
<td class="text-left">4.5M</td>
 <td class="text-center">
<asp:Button ID="Button3" runat="server" Text="Download" OnClick="Button3_Click" />
   
    </td>
</tr>
<tr>
<td class="text-left">JAVAScaript</td>
<td class="text-left">2.5M</td>
 <td class="text-center">
<asp:Button ID="Button4" runat="server" Text="Download" OnClick="Button4_Click" />
   
    </td>
</tr>
<tr>
<td class="text-left">CSS</td>
<td class="text-left">3M</td>
 <td class="text-center">
<asp:Button ID="Button5" runat="server" Text="Download" OnClick="Button5_Click" />
 </td>
</tr>
</tbody>
</table>
</asp:Content>
