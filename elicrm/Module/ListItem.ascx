<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListItem.ascx.cs" Inherits="Module_ListItem" ViewStateMode="Disabled" %>
<script type="text/javascript">
    function chekinputs(str) {
        $.blockUI({ message: '<h4 style="direction:rtl;font-family:tahoma;padding:5px">' + str + '</h4>', timeout: 2000 });
    }
    
    
    $(function () {
      
        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        var prodId = getParameterByName('m');
        if (prodId == "deletedSend" || prodId == "deletedResive") {
            $('a.deleterow').hide();
            $('input.chkSelect').hide();
        }

        $('.deleterow').click(function () {
            var mod = $('.deleterow').attr("mod");
            var _CountChecked = 0;
            var str = "";
            $("input.chkSelect").each(function () {
                if ($(this).is(':checked')) {
                    $(this).parent().parent().hide();
                    _CountChecked = _CountChecked + 1;
                    if (_CountChecked == 1) { str = str + $(this).attr("id") ; }
                    else { str = str + ","+ $(this).attr("id") ; }
                }
            });
            
            if (_CountChecked == 0) {
                chekinputs("Ther is no selected object");
                return false;
            }
            else {
                var _data = ("{'rowid':'" + str + "','mod':'" + mod+ "'}");
                $.ajax({
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    url: 'Ajax.aspx/DeleteRow',
                    data: _data,
                    async: false,
                    complete: function () { $.unblockUI(); },
                    success: function (response) {
                        if (response.d != "ok#") {
                            chekinputs("There is no change..", "Warning");
                            return false;
                        }
                    },
                    error: function (ts) {
                        chekinputs("System Error", "Warning");
                        return false;
                    }
                });
                
            }
        });
        
    });
</script>
<table class="item-list">
<asp:Repeater runat="server" ID="rptresive">
    <HeaderTemplate>
<%--        <thead>--%>
            <tr>
                <th  class="col col-list-1 th"><a href="#" class="deleterow" mod="1">Delete..</a></th>
                <th  class="col col-list-2 th"><%=caption %></th>
                <th class="col col-list-3 th">Subject</th>
                <th class="col col-list-4 th">Number</th>
                <th class="col col-list-4 th">Date</th>
                <th class="col col-list-5 th">Size</th>
            </tr>
       <%-- </thead>--%>
    </HeaderTemplate>
    <ItemTemplate>
        <%--<tbody>--%>
            <tr>
                <td class="col col-list-1">
                    <input  type="checkbox" id="<%#DataBinder.Eval(Container.DataItem, "ID")%>" class="chkSelect"/>
                    <img src="images/<%#DataBinder.Eval(Container.DataItem, "ISattach")%>.png"/><img src="images/is/<%#DataBinder.Eval(Container.DataItem, "Visit")%>.gif"/></td>
                <td  class="col col-list-2"><%#DataBinder.Eval(Container.DataItem, "DisplayName")%></td>
                <td class="col col-list-3" ><a class="messageto <%#DataBinder.Eval(Container.DataItem, "Visit")%>"   href="Default.aspx?ref=res&m=viewmessage&mesid=<%#DataBinder.Eval(Container.DataItem, "ID")%>"><%#DataBinder.Eval(Container.DataItem, "Title")%></a></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "ShomareName")%></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "DateCreate")%></td>
                <td class="col col-list-5"><%#DataBinder.Eval(Container.DataItem, "SizeAttach")%></td>
            </tr>
        <%--</tbody>--%>
    </ItemTemplate>
    <AlternatingItemTemplate>
         <tr class="AlternatingItem">
                <td class="col col-list-1"><input type="checkbox" id="<%#DataBinder.Eval(Container.DataItem, "ID")%>" class="chkSelect"/>
<img src="images/<%#DataBinder.Eval(Container.DataItem, "ISattach")%>.png"/><img src="images/is/<%#DataBinder.Eval(Container.DataItem, "Visit")%>.gif"/></td>
                <td class="col col-list-2"><%#DataBinder.Eval(Container.DataItem, "DisplayName")%></td>
                <td class="col col-list-3"><a class="messageto <%#DataBinder.Eval(Container.DataItem, "Visit")%>"  href="Default.aspx?ref=res&m=viewmessage&mesid=<%#DataBinder.Eval(Container.DataItem, "ID")%>"><%#DataBinder.Eval(Container.DataItem, "Title")%></a></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "ShomareName")%></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "DateCreate")%></td>
                <td class="col col-list-5"><%#DataBinder.Eval(Container.DataItem, "SizeAttach")%></td>

            </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
    </FooterTemplate>
</asp:Repeater>
<asp:Repeater runat="server" ID="rptsent">
    <HeaderTemplate>
<%--        <thead>--%>
            <tr>
                <th class="col col-list-1 th"><a href="#" class="deleterow" mod="0">Delete..</a></th>
                <th class="col col-list-3 th" style="width:60%">Subject</th>
                <th class="col col-list-4 th">Number</th>
                <th class="col col-list-4 th">Date</th>
                <th class="col col-list-5 th">Size</th>
            </tr>
       <%-- </thead>--%>
    </HeaderTemplate>
    <ItemTemplate>
        <%--<tbody>--%>
            <tr>
                <td class="col col-list-1">  <input type="checkbox" id="<%#DataBinder.Eval(Container.DataItem, "ID")%>" class="chkSelect"/><img src="images/<%#DataBinder.Eval(Container.DataItem, "ISattach")%>.png"/></td>
                <td class="col col-list-3" style="width:60%"><a class="messageto"  href="Default.aspx?ref=send&m=viewmessage&mesid=<%#DataBinder.Eval(Container.DataItem, "ID")%>"><%#DataBinder.Eval(Container.DataItem, "Title")%></a></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "ShomareName")%></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "DateCreate")%></td>
                <td class="col col-list-5"><%#DataBinder.Eval(Container.DataItem, "SizeAttach")%></td>
            </tr>
        <%--</tbody>--%>
    </ItemTemplate>
    <AlternatingItemTemplate>
         <tr class="AlternatingItem">
                <td class="col col-list-1">  <input type="checkbox" id="<%#DataBinder.Eval(Container.DataItem, "ID")%>" class="chkSelect"/><img src="images/<%#DataBinder.Eval(Container.DataItem, "ISattach")%>.png"/></td>
                <td class="col col-list-3" style="width:60%"><a class="messageto"  href="Default.aspx?ref=send&m=viewmessage&mesid=<%#DataBinder.Eval(Container.DataItem, "ID")%>"><%#DataBinder.Eval(Container.DataItem, "Title")%></a></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "ShomareName")%></td>
                <td class="col col-list-4"><%#DataBinder.Eval(Container.DataItem, "DateCreate")%></td>
                <td class="col col-list-5"><%#DataBinder.Eval(Container.DataItem, "SizeAttach")%></td>
            </tr>
    </AlternatingItemTemplate>
    <FooterTemplate>
    </FooterTemplate>
</asp:Repeater>
</table>