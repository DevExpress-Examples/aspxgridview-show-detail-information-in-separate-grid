Imports System
Imports DevExpress.Web

Namespace Solution

    Public Partial Class [Default]
        Inherits Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            gvMaster.DataBind()
            adsProducts.SelectParameters("CategoryID").DefaultValue = gvMaster.GetRowValues(CInt(gvMaster.FocusedRowIndex), "CategoryID").ToString()
        End Sub

        Protected Sub gvDetail_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
            Dim categoryId As String = gvMaster.GetRowValues(CInt(gvMaster.FocusedRowIndex), "CategoryID").ToString()
            adsProducts.SelectParameters("CategoryID").DefaultValue = categoryId
            gvDetail.DataBind()
        End Sub
    End Class
End Namespace
