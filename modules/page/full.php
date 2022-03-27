<?php
$moduleid = "page.full";
$filename = isset($_POST["fnm"]) ? $_POST["fnm"] : "";

$fileTpl = new TTemplate($moduleid);
$content = $fileTpl->Show(false);

?>