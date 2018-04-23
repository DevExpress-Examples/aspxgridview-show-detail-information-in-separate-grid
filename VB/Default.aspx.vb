Imports System

Partial Public Class Master_Detail_Two_Grids
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        gvMaster.DataBind()
        adsProducts.SelectParameters("CategoryID").DefaultValue = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CategoryID").ToString()
    End Sub

    Protected Sub gvDetail_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs)
        Dim categoryId As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "CategoryID").ToString()

        adsProducts.SelectParameters("CategoryID").DefaultValue = categoryId
        gvDetail.DataBind()
    End Sub
End Class