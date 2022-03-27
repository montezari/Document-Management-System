/*jslint unparam: true, regexp: true */
/*global window, $ */
$(function () {
    'use strict';
    var url = 'uploads/',
        uploadButton = $('<button/>')
            .addClass('btn btn-primary')
            .prop('disabled', true)
            .text('Processing...')
            .on('click', function () {
                var $this = $(this),
                    data = $this.data();
                	$this
                    .off('click')
                    .text('Abort')
                    .on('click', function () {
                        $this.remove();
                        data.abort();
                    });
                data.submit().always(function () {
                    $this.remove();
                });
            });
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        autoUpload: true,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxFileSize: 5000000, // 5 MB
        disableImageResize: /Android(?!.*Chrome)|Opera/
            .test(window.navigator.userAgent),
        singleFileUploads: true,
		maxNumberOfFiles: 1,
		previewMaxWidth: 240,
        previewMaxHeight: 210,
        previewCrop: true
    }).on('fileuploadadd', function (e, data) {
		$('#files').empty();
		$('#progress').show();
		data.context = $('<div/>').appendTo('#files');
        $.each(data.files, function (index, file) {
            var node = $('<p/>');
			node.appendTo(data.context);
        });
    }).on('fileuploadprocessalways', function (e, data) {
        var index = data.index,
            file = data.files[index],
            node = $(data.context.children()[index]);
        if (file.preview) {
            node
                .prepend('<br>')
                .prepend(file.preview);
        }
        if (file.error) {
            node
                .append('<br>')
                .append($('<span class="text-danger"/>').text(file.error));
        }
        if (index + 1 === data.files.length) {
            data.context.find('button')
                .text('Upload')
                .prop('disabled', !!data.files.error);
        }
    }).on('fileuploadprogressall', function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .progress-bar').css(
            'width',
            progress + '%'
        );
    }).on('fileuploaddone', function (e, data) {
        $.each(data.result.files, function (index, file) {
            if (file.url) {
                $('#progress').hide();
				$('#gbr').val(file.name);
				var link = $('<a>')
                    .attr('target', '_blank')
                    .prop('href', file.url);
                $(data.context.children()[index])
                    .wrap(link);
            } else if (file.error) {
                var error = $('<span class="text-danger"/>').text(file.error);
                $(data.context.children()[index])
                    .append('<br>')
                    .append(error);
            }
        });
    }).on('fileuploadfail', function (e, data) {
        $.each(data.files, function (index) {
            var error = $('<span class="text-danger"/>').text('File upload failed.');
            $(data.context.children()[index])
                .append('<br>')
                .append(error);
        });
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');
});

function ConfirmDelete(val){
  if(confirm('Hapus data ini?')){
     $('#fkey').val(val); 
	 $("form[name='grid']").submit();
  }  
}

function CopyDataKTP(){
  if(confirm('Anda yakin ingin salin info tinggal dari KTP?')){
     $('#alamattinggal').val($('#alamatktp').val()); 
     $('#kotatinggal').val($('#kotaktp').val()); 
     $('#kdpostinggal').val($('#kdposktp').val()); 
  }  
}

// kontrak
function dodelete_kt(buttonId){
  if(confirm('Hapus detail data ini?')){
    $("#trkt"+buttonId).remove();	
  }
}
// pendidikan formal
function dodelete_pf(buttonId){
  if(confirm('Hapus detail data ini?')){
    $("#trpf"+buttonId).remove();	
  }
}
// pendidikan non formal
function dodelete_pn(buttonId){
  if(confirm('Hapus detail data ini?')){
    $("#trpn"+buttonId).remove();	
  }
}
// pengalaman kerja
function dodelete_we(buttonId){
  if(confirm('Hapus detail data ini?')){
    $("#trwe"+buttonId).remove();	
  }
}
// kontak darurat
function dodelete_kd(buttonId){
  if(confirm('Hapus detail data ini?')){
    $("#trkd"+buttonId).remove();	
  }
}
// inventaris
function dodelete_in(buttonId){
  if(confirm('Hapus detail data ini?')){
    $("#trin"+buttonId).remove();	
  }
}

var itemCount_kt = 0;
var itemCount_pf = 0;
var itemCount_pn = 0;
var itemCount_we = 0;
var itemCount_kd = 0;
var itemCount_in = 0;
$(document).ready(function() {
	// kontrak
	$( "#add_button_kt" ).click(function() {	
		var html = "";
		var obj={
			"ROW_ID" : itemCount_kt,
			"MULAI" : $("#kt_tglmulai").val(),
			"AKHIR" : $("#kt_tglakhir").val(),
			"KETERANGAN" : $("#kt_penilaian").val()
		}   
		if(obj['MULAI']!="") {
		itemCount_kt--;
		html = "<tr id='trpf"+itemCount_kt+"'>"+
		       "<td><input type='text' class='form-control input-sm date-picker' name='kt_tglmulai[]' id='kt_tglmulai[]' value='"+obj['MULAI']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm date-picker' name='kt_tglakhir[]' id='kt_tglakhir[]' value='"+obj['AKHIR']+"'/></td>"+
			   "<td><textarea class='form-control input-sm' rows='2' name='kt_penilaian[]' id='kt_penilaian[]'>"+obj['KETERANGAN']+"</textarea></td>"+
			   "<td><a href='javascript:dodelete_kt("+itemCount_kt+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tblkontrak").append(html);
	    $('#kt_tglmulai').val("");
	    $('#kt_tglakhir').val("");
	    $('#kt_penilaian').val("");
		}else{
		 if(obj['MULAI']==""){
		    alert('Tanggal mulai kontrak harus di isi.');
		 }
		 if(obj['AKHIR']==""){
		    alert('Tanggal akhir kontrak harus di isi.');
		 }
	   }
	});
	// pendidikan formal
	$( "#add_button_pf" ).click(function() {	
		var html = "";
		var obj={
			"ROW_ID" : itemCount_pf,
			"TINGKATAN" : $("#pf_tingkatan").val(),
			"NAMA_INSTITUSI" : $("#pf_institusi").val(),
			"TAHUN" : $("#pf_tahun").val()
		}   
		if(obj['TINGKATAN']!="") {
		itemCount_pf--;
		html = "<tr id='trpf"+itemCount_pf+"'>"+
		       "<td><input type='text' class='form-control input-sm' name='pf_tingkatan[]' id='pf_tingkatan[]' value='"+obj['TINGKATAN']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='pf_institusi[]' id='pf_institusi[]' value='"+obj['NAMA_INSTITUSI']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='pf_tahun[]' id='pf_tahun[]' value='"+obj['TAHUN']+"'/></td>"+
			   "<td><a href='javascript:dodelete_pf("+itemCount_pf+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tblpendformal").append(html);
	    $('#pf_tingkatan').val("");
	    $('#pf_institusi').val("");
	    $('#pf_tahun').val("");
		}else{
		 if(obj['TINGKATAN']==""){
		    alert('Tingkatan harus di isi.');
		  }
		}
	});
	// pendidikan non formal
	$( "#add_button_pn" ).click(function() {	
		var html = "";
		var obj={
			"ROW_ID" : itemCount_pn,
			"PENDIDIKAN" : $("#pn_pendidikan").val(),
			"TAHUN" : $("#pn_tahun").val()
		}   
		if(obj['PENDIDIKAN']!="") {
		itemCount_pn--;
		html = "<tr id='trpn"+itemCount_pn+"'>"+
			   "<td><input type='text' class='form-control input-sm' name='pn_pendidikan[]' id='pn_pendidikan[]' value='"+obj['PENDIDIKAN']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='pn_tahun[]' id='pn_tahun[]' value='"+obj['TAHUN']+"'/></td>"+
			   "<td><a href='javascript:dodelete_pn("+itemCount_pn+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tblpendnon").append(html);
	    $('#pn_pendidikan').val("");
	    $('#pn_tahun').val("");
		}else{
		 if(obj['PENDIDIKAN']==""){
		    alert('Pendidikan harus di isi.');
		  }
		}
	});
	// pengalaman kerja
	$( "#add_button_we" ).click(function() {	
		var html = "";
		var obj={
			"ROW_ID" : itemCount_we,
			"TAHUNAWAL" : $("#we_tahun_awal").val(),
			"TAHUNAKHIR" : $("#we_tahun_akhir").val(),
			"PERUSAHAAN" : $("#we_perusahaan").val(),
			"KETERANGAN" : $("#we_keterangan").val()
		}   
		if(obj['PERUSAHAAN']!="") {
		itemCount_we--;
		html = "<tr id='trwe"+itemCount_we+"'>"+
		       "<td><input type='text' class='form-control input-sm' name='we_tahun_awal[]' id='we_tahun_awal[]' value='"+obj['TAHUNAWAL']+"'/></td>"+
		       "<td><input type='text' class='form-control input-sm' name='we_tahun_akhir[]' id='we_tahun_akhir[]' value='"+obj['TAHUNAKHIR']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='we_perusahaan[]' id='we_perusahaan[]' value='"+obj['PERUSAHAAN']+"'/></td>"+
			   "<td><textarea class='form-control input-sm' rows='2' name='we_keterangan[]' id='we_keterangan[]'>"+obj['KETERANGAN']+"</textarea></td>"+
			   "<td><a href='javascript:dodelete_we("+itemCount_we+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tblworkexp").append(html);
	    $('#we_tahun_awal').val("");
	    $('#we_tahun_akhir').val("");
	    $('#we_perusahaan').val("");
	    $('#we_keterangan').val("");
		}else{
		 if(obj['PERUSAHAAN']==""){
		    alert('Perusahaan harus di isi.');
		  }
		}
	});
	// kontak darurat
	$( "#add_button_kd" ).click(function() {	
		var html = "";
		var obj={
			"ROW_ID" : itemCount_kd,
			"HUBUNGAN" : $("#kd_hubungan").val(),
			"NAMA" : $("#kd_nama").val(),
			"TELP" : $("#kd_telp").val()
		}   
		if(obj['NAMA']!="") {
		itemCount_kd--;
		html = "<tr id='trkd"+itemCount_kd+"'>"+
		       "<td><input type='text' class='form-control input-sm' name='kd_hubungan[]' id='kd_hubungan[]' value='"+obj['HUBUNGAN']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='kd_nama[]' id='kd_nama[]' value='"+obj['NAMA']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm' name='kd_telp[]' id='kd_telp[]' value='"+obj['TELP']+"'/></td>"+
			   "<td><a href='javascript:dodelete_kd("+itemCount_kd+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tblkondarurat").append(html);
	    $('#kd_hubungan').val("");
	    $('#kd_nama').val("");
	    $('#kd_telp').val("");
		}else{
		 if(obj['HUBUNGAN']==""){
		    alert('Hubungan harus di isi.');
		  }else if(obj['NAMA']==""){
		    alert('Nama harus di isi.');
		  }else if(obj['TELP']==""){
		    alert('No Telp harus di isi.');
		  }
		}
	});
	// inventaris
	$( "#add_button_in" ).click(function() {	
		var html = "";
		var obj={
			"ROW_ID" : itemCount_in,
			"TERIMA" : $("#in_tglterima").val(),
			"KEMBALI" : $("#in_tglkembali").val(),
			"KETERANGAN" : $("#in_inventaris").val()
		}   
		if(obj['KETERANGAN']!="") {
		itemCount_in--;
		html = "<tr id='trpf"+itemCount_in+"'>"+
		       "<td><input type='text' class='form-control input-sm date-picker' name='in_tglterima[]' id='in_tglterima[]' value='"+obj['TERIMA']+"'/></td>"+
			   "<td><input type='text' class='form-control input-sm date-picker' name='in_tglkembali[]' id='in_tglkembali[]' value='"+obj['KEMBALI']+"'/></td>"+
			   "<td><textarea class='form-control input-sm' rows='2' name='in_inventaris[]' id='in_inventaris[]'>"+obj['KETERANGAN']+"</textarea></td>"+
			   "<td><a href='javascript:dodelete_in("+itemCount_in+")'><span class='glyphicon glyphicon-trash'></span></a></td></tr>";	
		$("#tblinv").append(html);
	    $('#in_tglterima').val("");
	    $('#in_tglkembali').val("");
	    $('#in_inventaris').val("");
		}else{
		 if(obj['KETERANGAN']==""){
		    alert('Inventaris harus di isi.');
		  }
		}
	});
	
	$('#form').bootstrapValidator({
        message: 'Nilai tidak valid',
        feedbackIcons: {
            valid: 'fa fa-check',
            invalid: 'fa fa-times',
            validating: 'fa fa-refresh'
        },
        fields: {
            nama: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    }
                }
            },
            nik: {
                message: 'Inputan tidak valid',
                validators: {
                    notEmpty: {
                        message: 'Inputan tidak boleh kosong dan harus di isi'
                    },
                    stringLength: {
                        min: 1,
                        max: 10,
                        message: 'Inputan maksimal 10 karakter'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'Inputan tidak valid'
                    },
                    remote: {
                        url: 'validate.php?m=master.pegawai',
                        message: 'Inputan sudah ada'
                    }
                }
            }
		}
    });
});
