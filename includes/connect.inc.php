<?php

  require_once "adodb/adodb.inc.php";

  $conn =&ADONewConnection('mysql');
  $conn->port = "3307";
  $conn->Connect($config["db_host"], $config["db_user"], $config["db_pass"], $config["db_name"]);
  $conn->SetFetchMode(ADODB_FETCH_ASSOC);
 
  set_magic_quotes_runtime(0);
//untuk debugging
//require_once "adodb/tohtml.inc.php";
//$conn->debug = TRUE;

?>