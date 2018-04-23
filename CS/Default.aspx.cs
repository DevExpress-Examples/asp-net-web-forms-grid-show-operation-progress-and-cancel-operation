using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class percentageProgress_1: System.Web.UI.Page {
    private static double progressInPercent;
    private static bool isCancelRequired;


    protected void gridView_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
        isCancelRequired = false;
        int countOfOperations = 100;

        for (int i = 0; i < countOfOperations; i++) {
            progressInPercent = Math.Round((double)i / countOfOperations * 100);

            System.Threading.Thread.Sleep(150);
            //Do some step here
            if (isCancelRequired)
                return;
        }
        gridView.JSProperties["cp_isFinished"] = true;
    }
    protected void clbProgress_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
        e.Result = progressInPercent.ToString();
    }

    protected void clbCancel_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
        isCancelRequired = true;
    }
}