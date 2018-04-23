<%-- BeginRegion --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Master_Detail_Two_Grids" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>How to show detail information in a separate ASPxGridView</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="AccessDataSource1" KeyFieldName="CategoryID"
            Width="598px" ClientInstanceName="masterGridView"><Columns>
                <dxwgv:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                </dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="CategoryID" Caption="CategoryID">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="CategoryName" Caption="CategoryName"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Description" Caption="Description"></dxwgv:GridViewDataTextColumn>
</Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <ClientSideEvents FocusedRowChanged="function(s, e) {
                if (typeof(detailGridView) != 'undefined')
                    detailGridView.PerformCallback(s.GetFocusedRowIndex());
            }" 
            />
        </dxwgv:ASPxGridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (?, ?, ?)" UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ? WHERE [CategoryID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
        </asp:AccessDataSource>
    
    </div>
        
        <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [SupplierID] FROM [Products]" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?" InsertCommand="INSERT INTO [Products] ([ProductID], [ProductName], [CategoryID], [SupplierID]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Products] SET [ProductName] = ?, [CategoryID] = ?, [SupplierID] = ? WHERE [ProductID] = ?" >
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="SupplierID" Type="Int32" />
            </InsertParameters>
        </asp:AccessDataSource>
        &nbsp;
                    <dxwgv:ASPxGridView runat="server" ClientInstanceName="detailGridView" KeyFieldName="ProductID"
                        AutoGenerateColumns="False" Width="599px" ID="ASPxGridView2"
                        OnCustomCallback="ASPxGridView2_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                <EditButton Visible="True">
                                </EditButton>
                                <ClearFilterButton Visible="True">
                                </ClearFilterButton>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" Caption="ProductID"
                                VisibleIndex="1">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ProductName" Caption="ProductName" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CategoryID" Caption="CategoryID" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="SupplierID" Caption="SupplierID" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True"></Settings>
                        <ClientSideEvents Init="function(s, e) {
	s.PerformCallback(masterGridView.GetFocusedRowIndex());
}" />
                    </dxwgv:ASPxGridView>
    </form>
</body>
</html>
