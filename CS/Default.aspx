<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="percentageProgress_1" EnableSessionState="False" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function btStart_Click(s, e) {
            gridView.PerformCallback();
            loadingPanel.Show();
            timerCheckProgress.SetEnabled(true);
            progressBar.SetPosition(0);

            btStart.SetEnabled(false);
            btCancel.SetEnabled(true);
        }

        function gridView_EndCallback(s, e) {
            loadingPanel.Hide();
            timerCheckProgress.SetEnabled(false);
            btStart.SetEnabled(true);

            btCancel.SetEnabled(false);

            if (s.cp_isFinished) {
                alert("Process is complete");
                delete (s.cp_isFinished);
            }
        }

        function btCancel_Click(s, e) {
            clbCancel.PerformCallback();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False" DataSourceID="ads"
            KeyFieldName="CategoryID" ClientInstanceName="gridView" OnCustomCallback="gridView_CustomCallback">
            <ClientSideEvents EndCallback="gridView_EndCallback" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsLoadingPanel Mode="Disabled" />
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]"></asp:AccessDataSource>
        <dx:ASPxButton ID="btStart" runat="server" Text="Start" AutoPostBack="false" ClientInstanceName="btStart">
            <Image IconID="people_walking_32x32devav"></Image>
            <ClientSideEvents Click="btStart_Click" />
        </dx:ASPxButton>

        <dx:ASPxButton ID="btCancel" runat="server" Text="Cancel" AutoPostBack="false" ClientEnabled="false">
            <Image IconID="actions_cancel_32x32"></Image>
            <ClientSideEvents Click="btCancel_Click" />
        </dx:ASPxButton>


        <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server"
            ClientInstanceName="loadingPanel" Modal="True" ContainerElementID="gridView">
            <Template>
                <div style="text-align: center">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Processing..." Font-Size="18"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxProgressBar ID="ASPxProgressBar1" runat="server" Position="0"
                        Width="200px" ClientInstanceName="progressBar">
                    </dx:ASPxProgressBar>
                </div>
            </Template>
        </dx:ASPxLoadingPanel>

        <dx:ASPxCallback ID="clbProgress" runat="server" ClientInstanceName="clbProgress" OnCallback="clbProgress_Callback">
            <ClientSideEvents
                CallbackComplete="function(s, e) {
                    progressBar.SetPosition(e.result);
                }" />
        </dx:ASPxCallback>

        <dx:ASPxTimer ID="timerCheckProgress" runat="server" ClientInstanceName="timerCheckProgress" Enabled="False" Interval="300">
            <ClientSideEvents
                Tick="function(s, e) {
	                clbProgress.PerformCallback();
                }" />
        </dx:ASPxTimer>

        <dx:ASPxCallback ID="clbCancel" runat="server" ClientInstanceName="clbCancel" OnCallback="clbCancel_Callback"></dx:ASPxCallback>
    </form>
</body>
</html>
