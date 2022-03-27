<?php

$mode = $_REQUEST["mode"] == "form" ? 1 : 0;
$moduleid = "master.kategori";
$frmcaption = $mode==1 ? "Form Entry" : "Grid Layout"; 

if(strtoupper($_POST["FormAction"])=="SIMPAN"){
  $grpkat = isset($_POST["grpkat"]) && ($_POST["grpkat"]!="") ? "'".$_POST["grpkat"]."'" : "NULL";
  if($_POST["fkey"] != ""){
    $sql  = "update tm_kategori set vNmKategori='$_POST[nama]', cKdGrpKategori=$grpkat, cUserEdit = '$_SESSION[Logged]', cDateEdit = CURRENT_TIMESTAMP ";
    $sql .= "where cKdKategori = '$_POST[fkey]' ";
  }else{
    $sql  = "insert into tm_kategori (vNmKategori, cKdGrpKategori, cUserEntry, cDateEntry, cUserEdit, cDateEdit) ";
    $sql .= "values('$_POST[nama]',$grpkat,'$_SESSION[Logged]',CURRENT_TIMESTAMP,'$_SESSION[Logged]',CURRENT_TIMESTAMP) ";
  }
  $conn->Execute($sql); 
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}elseif(strtoupper($_POST["FormAction"])=="HAPUS"){
  $sql = "delete from tm_kategori where cKdKategori = '$_POST[fkey]' ";
  $conn->Execute($sql);
  header("Location: $config[http]$_SERVER[REQUEST_URI]");
  exit;
}

$admGrdTpl = new TGridTemplate($moduleid);
$sql  = "SELECT kat.*, grp.cKdKategori AS cKdGrpKategori,grp.vNmKategori AS vNmGrpKategori FROM tm_kategori kat "; 
$sql .= "LEFT JOIN tm_kategori grp ON grp.cKdKategori = kat.cKdGrpKategori ";
if($_GET["key"] != "" || $_GET["mode"] == "form"){
  $sql .= " WHERE kat.cKdKategori = '$_GET[key]' ";
}
$sql .= "ORDER BY CONCAT(COALESCE(DATE_FORMAT(grp.cDateEntry,'%Y%m%d%H%i%S'),''),DATE_FORMAT(kat.cDateEntry,'%Y%m%d%H%i%S')), grp.vNmKategori ";
$admGrdTpl->moduleid  = $moduleid;
$admGrdTpl->delform   = "m=$moduleid&page=$_GET[page]";
$admGrdTpl->custSQL = $sql;
if($mode=="1"){
  $sql = "SELECT grp.cKdKategori AS cKdGrpKategori,grp.vNmKategori AS vNmGrpKategori FROM tm_kategori grp WHERE grp.cKdGrpKategori IS NULL ORDER BY grp.vNmKategori ";
  $admGrdTpl->template->MergeBlock("blk_grp","adodb",$sql);
}
$gTpl = new TBlock("form.general_box");
$gTpl->name		= "gTpl";
$gTpl->title    = "Category";
$gTpl->display  = $admGrdTpl->Show(false);
$content = $gTpl->Show(false);

?>