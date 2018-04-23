<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Master_Detail_Two_Grids" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to show detail information in a separate ASPxGridView</title>
    <script type="text/javascript">
        function UpdateDetailGrid(s, e) {
            detailGridView.PerformCallback();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="gvMaster" runat="server" ClientInstanceName="masterGridView"
            DataSourceID="adsCategories" AutoGenerateColumns="False" KeyFieldName="CategoryID">
            
            <SettingsBehavior AllowFocusedRow="True" AllowClientEventsOnLoad="False" />
            <ClientSideEvents FocusedRowChanged="UpdateDetailGrid" />

            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="CategoryID" Caption="CategoryID">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="CategoryName" Caption="CategoryName">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="3" FieldName="Description" Caption="Description">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        
        <dx:ASPxGridView ID="gvDetail" runat="server" ClientInstanceName="detailGridView" 
            DataSourceID="adsProducts" AutoGenerateColumns="False" KeyFieldName="ProductID" OnCustomCallback="gvDetail_CustomCallback">

            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" Caption="ProductID" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" Caption="ProductName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryID" Caption="CategoryID" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SupplierID" Caption="SupplierID" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:AccessDataSource ID="adsCategories" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]">
        </asp:AccessDataSource>

        <asp:AccessDataSource ID="adsProducts" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [SupplierID] FROM [Products] WHERE CategoryID = ?">
            <SelectParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:AccessDataSource>
    </div>
    </form>
</body>
</html>