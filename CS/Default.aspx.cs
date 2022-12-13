using System;

public partial class Master_Detail_Two_Grids : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        gvMaster.DataBind();
        adsProducts.SelectParameters["CategoryID"].DefaultValue = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CategoryID").ToString();
    }

    protected void gvDetail_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
        string categoryId = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CategoryID").ToString();

        adsProducts.SelectParameters["CategoryID"].DefaultValue = categoryId;
        gvDetail.DataBind();
    }
}