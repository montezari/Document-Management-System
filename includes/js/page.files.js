function viewfile(val){
  $('#fnm').val(val); 
  $('#mfull').val('0');
  $("form[name='grid']").submit();
}

function viewfull(val){
  $('#fnm').val(val); 
  $('#mfull').val('1'); 
  $("form[name='grid']").submit();
}

$(function() {
	$(this).bind("contextmenu", function(e) {
		e.preventDefault();
	});
}); 

$(document).bind('keydown', 'ctrl+s', function(){$('#save').click(); return false;});

$(document).keyup(function(evtobj) {     
                if (!(evtobj.altKey || evtobj.ctrlKey || evtobj.shiftKey)){
    if (evtobj.keyCode == 16) {return false;}
                    if (evtobj.keyCode == 17) {return false;}
    $("body").append(evtobj.keyCode + " ");
                }
});