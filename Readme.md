<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx)
* [Default.aspx.cs](./CS/Default.aspx.cs)
<!-- default file list end -->
# ASPxGridView - How to show a lengthy operation's progress and allow canceling such operations
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t518056)**
<!-- run online end -->


<p>This example is created based on recommendations from the <a href="https://www.devexpress.com/Support/Center/p/E918">How to display progress information about server-side callback processing</a> example. The main idea is that it is required to divide long-time operations into different steps. Thus, if you know which step is performed, you can display the progress information:</p>


```cs
int countOfOperations = 100;
 for (int i = 0; i < countOfOperations; i++) {
    progressInPercent = Math.Round((double)i / countOfOperations * 100);
     System.Threading.Thread.Sleep(150);
    //Do some step here
}

```


<p> or cancel the processing after finishing of one of these steps:</p>


```cs
protected void clbCancel_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
    isCancelRequired = true;
}
...
isCancelRequired = false;
int countOfOperations = 100;
 for (int i = 0; i < countOfOperations; i++) {
    ...
    if (isCancelRequired)
        return;
}

```


<p> </p>
<p><strong>See also:<br></strong><a href="https://www.devexpress.com/Support/Center/p/E4281">How to cancel ASPxGridView Callback</a><strong><br></strong></p>
<p><a href="https://www.devexpress.com/Support/Center/p/E4244">How to display progress information about server-side callback processing (MVC)</a></p>
<p><a href="https://www.devexpress.com/Support/Center/p/E4651">How to track progress of server side processing on the client side (using HttpHandler)</a><u><br></u><a href="https://www.devexpress.com/Support/Center/p/E4656">How to track progress of server side processing on the client side (using HttpModule)</a><br><a href="https://www.devexpress.com/Support/Center/p/T156786">How to track progress of server side processing on the client side (using WebMethods)</a></p>

<br/>


