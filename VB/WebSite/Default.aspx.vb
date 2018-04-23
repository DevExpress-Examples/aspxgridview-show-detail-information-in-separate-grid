Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Master_Detail_Two_Grids
	Inherits System.Web.UI.Page
   Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		Dim filterExpression As String = Convert.ToString(Session("FilterExpression"))
		If filterExpression <> String.Empty Then
			AccessDataSource2.FilterExpression = filterExpression
			ASPxGridView2.DataSource = AccessDataSource2
			ASPxGridView2.DataSourceID = String.Empty
			ASPxGridView2.DataBind()
		End If
   End Sub
	Protected Sub ASPxGridView2_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs)
		Dim values As Object = ASPxGridView1.GetRowValues(ASPxGridView1.FocusedRowIndex, New String() { "CategoryID" })
		ASPxGridView2.DataSource = Nothing
		Dim filterExpression As String = "CategoryID='" & values.ToString() & "'"
		Session("FilterExpression") = filterExpression
		AccessDataSource2.FilterExpression = filterExpression
		ASPxGridView2.DataSource = AccessDataSource2
		ASPxGridView2.PageIndex = 0
		ASPxGridView2.DataBind()
	End Sub

End Class
