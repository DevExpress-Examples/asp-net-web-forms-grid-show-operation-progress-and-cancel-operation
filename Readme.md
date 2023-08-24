<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128535475/16.2.6%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T518056)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Grid View for ASP.NET Web Forms - How to show a lengthy operation's progress and allow canceling such operations
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t518056/)**
<!-- run online end -->

This example is created based on recommendations from the [How to display progress information about server-side callback processing](https://github.com/DevExpress-Examples/web-forms-display-progress-information-about-callback-process) example.

## Overview

The main idea is to divide long-time operations into different steps. Thus, if you know which step is performed, you can display the progress information:

```cs
int countOfOperations = 100;
for(int i = 0; i < countOfOperations; i++) {
    progressInPercent = Math.Round((double)i / countOfOperations * 100);
     System.Threading.Thread.Sleep(150);
    //Do some steps here
}
```

Or cancel the processing after finishing of one of these steps:

```cs
protected void clbCancel_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
    isCancelRequired = true;
}
// ...
isCancelRequired = false;
int countOfOperations = 100;
for(int i = 0; i < countOfOperations; i++) {
    // ...
    if(isCancelRequired)
        return;
}
```

## Files to Review

* [Default.aspx](./CS/Default.aspx)
* [Default.aspx.cs](./CS/Default.aspx.cs)

## More Examples

* [How to cancel ASPxGridView Callback](https://github.com/DevExpress-Examples/how-to-cancel-aspxgridview-callback-e4281)
* [How to display progress information about server-side callback processing (MVC)](https://github.com/DevExpress-Examples/how-to-display-progress-information-about-server-side-callback-processing-mvc-e4244)
* [How to use HTTP handlers to display the progress of a server-side process on the client](https://github.com/DevExpress-Examples/asp-net-web-forms-use-httphandler-to-display-server-side-process-progress)
* [How to track progress of server side processing on the client side (using HttpModule)](https://github.com/DevExpress-Examples/how-to-track-progress-of-server-side-processing-on-the-client-side-using-httpmodule-e4656)
* [How to use the WebMethod attribute to display the progress of a server-side process on the client](https://github.com/DevExpress-Examples/asp-net-web-forms-progress-bar-display-server-process-progress)
