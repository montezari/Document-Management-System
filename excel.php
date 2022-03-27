<?php

require_once "includes/global.inc.php";
require_once "modules/xls/repo.inc.php";

ini_set('max_execution_time',1200);

if(isset($_SESSION["Logged"])){

  $today = date("Ymd_His");
  if($_REQUEST["id"]=="report.statuspegawai"){
    $xlsrpt = new TExcelRptStatusPegawai();
    $xlsrpt->doExportXls();
  }


}

?>