<div class="row">
    <div class="col-md-12">
        [onload_1; when [var.mode;noerr]==5; block=div]
        <div class="portlet light">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift font-red-sunglo"></i>
                    <span class="caption-subject font-red-sunglo bold">Show File</span>
                    <span class="caption-helper">[var.filename;noerr;]</span>
                </div>
                <div class="actions">
                    <a href="?m=page.files" class="btn btn-default btn-circle">
                    <i class="fa fa-reply"></i>
                    <span class="hidden-480">
                    Back </span>
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <iframe src="includes/pdfjs/web/index.html?file=[var.filename;noerr;]" style="width:100%; height:600px;" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>                   
