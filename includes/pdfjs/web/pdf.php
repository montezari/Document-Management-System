<?php
// if ( ! defined('BASEPATH')) exit('No direct script access allowed');
//if (basename($_SERVER['PHP_SELF']) == basename(__FILE__)) { die('No direct script access allowed'); }; 

/*
require "Browser.php";

$browser = new Browser();
if( $browser->getBrowser() == Browser::BROWSER_CHROME) {
    die('Aplikasi hanya berjalan di firefox');
}
*/

$file = 'D:\xampp\htdocs\dms\includes\pdfjs\web\compressed.tracemonkey-pldi-09.pdf';
$filename = 'compressed.tracemonkey-pldi-09.pdf'; /* Note: Always use .pdf at the end. */

header("Pragma: public");
header("Expires: -1");
header("Cache-Control: public, must-revalidate, post-check=0, pre-check=0");
header('Cache-Control: private',true);

header('Content-type: application/pdf');
header('Content-Disposition: inline; filename="' . $filename . '"');
header('Content-Transfer-Encoding: binary');
header('Content-Length: ' . filesize($file));
header('Accept-Ranges: none');
header('Connection: close');

@readfile($file);

exit();
?>