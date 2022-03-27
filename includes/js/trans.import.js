function ConfirmDelete(val){
  var key = document.form.fkey;
  
  if(confirm('anda yakin ingin menghapus data ini...?')){
     key.value = val; 
	 document.grid.submit();
  }  
}

$(document).ready(function() {

var bar = $('#bar');
var status = $('#status');

$('form').ajaxForm({
    beforeSend: function() {
        status.empty();
        var percentVal = '0%';
        bar.width(percentVal)
        status.html(percentVal);
    },
    uploadProgress: function(event, position, total, percentComplete) {
        var percentVal = percentComplete + '%';
        bar.width(percentVal)
        status.html(percentVal);
    },
    complete: function(xhr) {
		status.html(xhr.responseText);
		$('#hapus').click();
    }
}); 

})();       