<div class="row">
[onload_2; when [var.modefull;noerr]==0; block=div]
    <div class="col-md-3">
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption font-green-sharp">
                    <i class="icon-speech font-green-sharp"></i>
                    <span class="caption-subject bold"> My Folder</span>
                </div>
                <div class="actions">
                    <div class="btn-group">
                        <a class="btn btn-default btn-circle" href="javascript:;" data-toggle="dropdown">
                        <i class="fa fa-share"></i>
                        <span class="hidden-480">
                        Action </span>
                        <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <li>
                                <a href="?m=page.files&mode=1">
                                Add Folder </a>
                            </li>
                            <li>
                                <a href="?m=page.files&mode=2">
                                Rename Folder </a>
                            </li>
                            <li>
                                <a href="?m=page.files&mode=3">
                                Delete Folder </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <div class="scroller" style="height:300px" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
                    <div id="tree_1" class="tree-demo">
                        <ul>
                            <li id="0" title="[var._SESSION.cLoggedName;noerr;]">[var._SESSION.cLoggedName;noerr;]
                              [var.tree;noerr;] 
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-9">
        [onload_1; when [var.mode;noerr]==0; block=div]
        <div class="portlet light">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift font-red-sunglo"></i>
                    <span class="caption-subject font-red-sunglo bold">Private Folder</span>
                    <span class="caption-helper">&nbsp;</span>
                </div>
                <div class="actions">
                    <a href="?m=page.files&mode=4" class="btn btn-default btn-circle">
                    <i class="fa fa-plus"></i>
                    <span class="hidden-480">
                    New Document </span>
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="table-container">
                   <form action="index.php?m=page.files&mode=5" method="post" name='grid'>
                   <input name='fnm' id='fnm' type='hidden' size=/>
                   <input name='mfull' id='mfull' type='hidden' size=/>
                   <table class="table table-hover" id="datatable_ajax">
                    <thead>
                        <tr role="row">
                            <th>Name</th>
                            <th width="10%">Owner</th>
                            <th width="16%">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-9">
        [onload_1; when [var.mode;noerr]==1; block=div]
        <div class="portlet light">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift font-red-sunglo"></i>
                    <span class="caption-subject font-red-sunglo bold">Add Folder</span>
                    <span class="caption-helper">&nbsp;</span>
                </div>
            </div>
            <div class="portlet-body">
                <form name="form" id="form" method="post" action="?m=[var.moduleid;noerr]">
                <input name='fmode' id='fmode' type='hidden' value="1" size=/>
                    <div class="form-body">
						<div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Parent Folder</label>
                                    <input name='froot' id='froot' type='hidden' value="[var.froot;noerr;]" size=/>
                                    <input type="text" name="parent" id="parent" class="form-control" value="[var.parent;noerr;]" readonly/>
                                </div>
                            </div>
                        </div>
						<div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Folder Name</label>
                                    <input type="text" name="nama" id="nama" autocomplete="off" class="form-control" value=""/>
                                </div>
                            </div>
                        </div>
                     </div>
                     
	                <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-9">
                                <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn red-sunglo">Process</button>
                                <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.moduleid;noerr]';" value="Batal" class="btn default">Cancel</button>
                            </div>
                        </div>
                    </div>
                 </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

    <div class="col-md-9">
        [onload_1; when [var.mode;noerr]==2; block=div]
        <div class="portlet light">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift font-red-sunglo"></i>
                    <span class="caption-subject font-red-sunglo bold">Rename Folder</span>
                    <span class="caption-helper">&nbsp;</span>
                </div>
            </div>
            <div class="portlet-body">
                <form name="form" id="form" method="post" action="?m=[var.moduleid;noerr]">
                <input name='fmode' id='fmode' type='hidden' value="2" size=/>
                    <div class="form-body">
						<div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Parent Folder</label>
                                    <input name='froot' id='froot' type='hidden' value="[var.froot;noerr;]" size=/>
                                    <input type="text" name="parent" id="parent" class="form-control" value="[var.parent;noerr;]"/>
                                </div>
                            </div>
                        </div>
                     </div>
                     
	                <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-9">
                                <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn red-sunglo">Process</button>
                                <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.moduleid;noerr]';" value="Batal" class="btn default">Cancel</button>
                            </div>
                        </div>
                    </div>
                 </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

    <div class="col-md-9">
        [onload_1; when [var.mode;noerr]==3; block=div]
        <div class="portlet light">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift font-red-sunglo"></i>
                    <span class="caption-subject font-red-sunglo bold">Delete Folder</span>
                    <span class="caption-helper">&nbsp;</span>
                </div>
            </div>
            <div class="portlet-body">
                <form name="form" id="form" method="post" action="?m=[var.moduleid;noerr]">
                <input name='fmode' id='fmode' type='hidden' value="3" size=/>
                    <div class="form-body">
						<div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Folder Name</label>
                                    <input name='froot' id='froot' type='hidden' value="[var.froot;noerr;]" size=/>
                                    <input type="text" name="parent" id="parent" class="form-control" value="[var.parent;noerr;]" readonly/>
                                </div>
                            </div>
                        </div>
                     </div>
                     
	                <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-9">
                                <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn red-sunglo">Process</button>
                                <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.moduleid;noerr]';" value="Batal" class="btn default">Cancel</button>
                            </div>
                        </div>
                    </div>
                 </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

    <div class="col-md-9">
        [onload_1; when [var.mode;noerr]==4; block=div]
        <div class="portlet light">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-gift font-red-sunglo"></i>
                    <span class="caption-subject font-red-sunglo bold">New Document</span>
                    <span class="caption-helper">&nbsp;</span>
                </div>
            </div>
            <div class="portlet-body">
                <form name="form" id="form" method="post" action="?m=[var.moduleid;noerr]">
                <input name='fmode' id='fmode' type='hidden' value="4" size=/>
                    <div class="form-body">
						<div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Document Name</label>
                                    <input type="text" name="nama" id="nama" autocomplete="off" class="form-control" value=""/>
                                </div>
                            </div>
                        </div>
 						<div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Comment</label>
                                    <textarea class="form-control" id="ket" name="ket" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label">Category</label>
                                    <select class="form-control" id="kategori" name="kategori">
                                        <option value='[blk_kat.cKdKategori;noerr;block=option]'>[blk_kat.vNmKategori;noerr;block=option]</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                      	<div class="row">
                            <div class="col-md-4">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="input-group input-large">
                                        <div class="form-control uneditable-input span3" data-trigger="fileinput">
                                            <i class="fa fa-file fileinput-exists"></i>&nbsp; <span class="fileinput-filename">
                                            </span>
                                        </div>
                                        <span class="input-group-addon btn default btn-file">
                                        <span class="fileinput-new">
                                        Select file </span>
                                        <span class="fileinput-exists">
                                        Change </span>
                                        <input type="file" name="...">
                                        </span>
                                        <a href="javascript:;" class="input-group-addon btn red fileinput-exists" data-dismiss="fileinput">
                                        Remove </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                      	<div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        
                    </div>
                     
	                <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-9">
                                <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn red-sunglo">Process</button>
                                <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.moduleid;noerr]';" value="Batal" class="btn default">Cancel</button>
                            </div>
                        </div>
                    </div>
                 </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>
    
    <div class="col-md-9">
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
                <iframe id="fileviewer" src="includes/pdfjs/web/index.html?file=[var.filename;noerr;]" style="width:100%; height:600px;" frameborder="0"></iframe>
            </div>
        </div>
    </div>

</div>                   

<div class="row">
[onload_2; when [var.modefull;noerr]==1; block=div]
    <div class="col-md-12">
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
                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <iframe src="includes/pdfjs/web/index.html?file=[var.filename;noerr;]" style="width:100%; height:600px;" frameborder="0"></iframe>
            </div>
        </div>
    </div>
</div>                                  