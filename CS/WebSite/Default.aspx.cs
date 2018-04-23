using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Master_Detail_Two_Grids : System.Web.UI.Page 
{
   protected void Page_Load(object sender, EventArgs e) {
        string filterExpression = Convert.ToString(Session["FilterExpression"]);
        if(filterExpression != string.Empty) {
            AccessDataSource2.FilterExpression = filterExpression;
            ASPxGridView2.DataSource = AccessDataSource2;
            ASPxGridView2.DataSourceID = string.Empty;
            ASPxGridView2.DataBind();
        }
    }
    protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e) {
        object values = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, new string[] { "CategoryID" });
        ASPxGridView2.DataSource = null;
        string filterExpression = "CategoryID='" + values.ToString() + "'";
        Session["FilterExpression"] = filterExpression;
        AccessDataSource2.FilterExpression = filterExpression;
        ASPxGridView2.DataSource = AccessDataSource2;
        ASPxGridView2.PageIndex = 0;
        ASPxGridView2.DataBind();
    }

}
