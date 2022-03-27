<div class="row">
	<div class="col-md-12">
    [onload_1; when [var.mode;noerr]==0; block=div]
    <div class="portlet light bordered">
        <div class="portlet-title">
            <div class="caption font-green-sharp">
                <i class=" icon-screen-desktop font-green-sharp"></i>
                <span class="caption-subject font-green bold">[var.frmcaption;noerr]</span>
                <span class="caption-helper">&nbsp;</span>
            </div>
        </div>
        <div class="portlet-body">
            <div class="box-header">
              <div>
                <div>Jumlah Data : [var.~recordcount;noerr]</div>
                <div>Halaman : [var.~page_sequence;noerr]</div>
              </div>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="example2" class="table table-bordered table-hover">
                <form action="index.php?m=[var.~moduleid;noerr]" method="post" name='grid'>
                <input name='fkey' id='fkey' type='hidden' size=/>
                    <thead>
                        <tr>
                            <th>Office Name</th>
                            <th>City</th>
                            <th colspan="2">&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>[grid_blk.vNmKantor;noerr;block=tr]</td>
                            <td>[grid_blk.cKota;noerr;block=tr]</td>
                            <td width="25" align="center">[var.button.E;if [var.button.E;noerr]=='valid';then <a href="#" title="Edit Data" class="back" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form&key=[grid_blk.cKdKantor;noerr]'"><span class="glyphicon glyphicon-eject"></span></a>;else <span class="glyphicon glyphicon-eject"></span>]</td>
                            <td width="25" align="center">[var.button.D;if [var.button.D;noerr]=='valid';then <a href="#" title="Delete Data" class="back" onClick="ConfirmDelete('[grid_blk.cKdKantor;noerr]')"><span class="glyphicon glyphicon-trash"></span></a>;else <span class="glyphicon glyphicon-trash"></span>]</td>
                        </tr>
                        <tr>
                          <td colspan="2">&nbsp;</td>
                          <td colspan="2" align="center">[var.button.A;if [var.button.A;noerr]=='valid';then <a href="#" class="back" title="Add Data" onClick="window.location = '?m=[var.~moduleid;noerr]&mode=form'"><span class="glyphicon glyphicon-plus"></span></a>;else <span class="glyphicon glyphicon-plus"></span>]</td>
                        </tr>
                    </tbody>
                    <input type="hidden" name="FormAction" value="HAPUS">
  					</form>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
        </div>  
    </div><!-- /.col --> 
        
    <div class="col-md-12">
    [onload_1; when [var.mode;noerr]==1; block=div]
        <div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption font-green-sharp">
                    <i class=" icon-screen-desktop font-green-sharp"></i>
                    <span class="caption-subject font-green bold">[var.frmcaption;noerr]</span>
                    <span class="caption-helper">&nbsp;</span>
                </div>
            </div>
            <div class="portlet-body form">
                <form name="form" id="form" method="post" action="?m=[var.~moduleid;noerr]">
                <input name='fkey' id='fkey' type='hidden' value='[grid_blk.cKdKantor;noerr;]' size=/>
                    <div class="form-body">
						<div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Office Name</label>
                                    <input type="text" name="nama" id="nama" class="form-control" value="[grid_blk.vNmKantor;noerr;]" [onshow; if [grid_blk.cKdKantor;noerr]!='';then 'readonly';else '']/>
                                </div>
                            </div>
                        </div>
						<div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label">Address</label>
                                    <textarea class="form-control" id="alamat" name="alamat" rows="3">[grid_blk.cAlamat;noerr;]</textarea>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <label>City</label>
                                    <input type="text" name="kota" id="kota" class="form-control" value="[grid_blk.cKota;noerr;]"/>
                                </div>
                            </div>
                        </div>
						<div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" name="telp" id="telp" class="form-control" value="[grid_blk.cNoTelp;noerr;]"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Fax</label>
                                    <input type="text" name="fax" id="fax" class="form-control" value="[grid_blk.cFax;noerr;]"/>
                                </div>
                            </div>
                        </div>
                     </div>
                     
	                <div class="form-actions fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-9">
                                    <button type="submit" id="FormAction" name="FormAction" value="Simpan" class="btn red-sunglo">Save</button>
                                    <button type="button" id="FormBatal" name="FormBatal" onclick="window.location = 'index.php?m=[var.~moduleid;noerr][var.~page_url;noerr]';" value="Batal" class="btn default">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                 </form>
                <!-- END FORM-->
            </div>
        </div>
    </div>

</div>



