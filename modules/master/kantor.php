<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.kantor";
$frmcaption = $mode==1 ? "Form Entry" : "Grid Layout"; 

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  if($_POST["fkey"] != ""){
    $sql  = "update tm_kantor set vNmKantor='$_POST[nama]',cAlamat='$_POST[alamat]',cKota='$_POST[kota]',cNoTelp='$_POST[telp]',cFax='$_POST[fax]', ";
	$sql .= "cUserEdit = '$_SESSION[Logged]', cDateEdit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdKantor = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_kantor (vNmKantor,cAlamat,cKota,cNoTelp,cFax,cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[nama]','$_POST[alamat]','$_POST[kota]','$_POST[telp]','$_POST[fax]', ";
	$sql .= "'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_kantor WHERE cKdKantor = '$_POST[fkey]' ";
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}	

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT * FROM tm_kantor  ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE cKdKantor = '$_GET[key]' ";
}
$sql .= " ORDER BY cKdKantor ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Office";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>