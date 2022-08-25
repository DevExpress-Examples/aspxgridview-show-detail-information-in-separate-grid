Imports System

Namespace Solution

    Public Class Global_asax
        Inherits Web.HttpApplication

        Private Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
            AddHandler DevExpress.Web.ASPxWebControl.CallbackError, New EventHandler(AddressOf Application_Error)
            DevExpress.Security.Resources.AccessSettings.DataResources.SetRules(DevExpress.Security.Resources.DirectoryAccessRule.Allow(Server.MapPath("~/Content")), DevExpress.Security.Resources.UrlAccessRule.Allow())
        End Sub

        Private Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
        End Sub

        Private Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
        End Sub

        Private Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
        End Sub

        Private Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
        End Sub
    End Class
End Namespace
