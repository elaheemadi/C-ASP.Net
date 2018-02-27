<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RightMenu.ascx.cs" Inherits="Module_RightMenu" %>

 <div class="demo-container size-thin">
        <telerik:RadPanelBar runat="server" ID="RadPanelBar1"  Width="100%" ExpandMode="FullExpandedItem" OnClientItemClicked="OnClientItemClicked">
            <Items>
                
                <telerik:RadPanelItem Text="E-Mail" ImageUrl="images/mail.gif" Expanded="True">
                    <Items>
                        <telerik:RadPanelItem ImageUrl="images/mailPersonalFolders.gif" Text="Setting" cmd="1"/>
                        <telerik:RadPanelItem ImageUrl="images/mailDeletedItems.gif" Text="Deleted" cmd="2" />
                        <telerik:RadPanelItem ImageUrl="images/mailInbox.gif" Text="Inbox" cmd="inbox"/>
                        <telerik:RadPanelItem ImageUrl="images/mailFolder.gif" Text="Send" cmd="send"/>
                        <telerik:RadPanelItem ImageUrl="images/mailSent.gif" Text="Sent Item" cmd="sent"/>
                    </Items>
                </telerik:RadPanelItem>
    
            </Items>
           
        </telerik:RadPanelBar>
  
    </div>