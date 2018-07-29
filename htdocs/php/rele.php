<?php
//header('Content-type: text/html; charset=UTF-8');
//print_r($_POST);
//$b = file_get_contents('http://www.cs.tut.fi/~jkorpela/webjulk/2.6.html');
$b = get_remote_data('http://www.cs.tut.fi/~jkorpela/webjulk/2.6.html');
//echo mb_detect_encoding($b);
//$r = mb_convert_encoding($b,'ISO-8859-2','Windows-1252');
//$string = mb_convert_encoding($r, 'HTML-ENTITIES', "UTF-8");

print($b);
//echo($r);

function get_remote_data($url) {
    $ch = curl_init($url);
   // curl_setopt($ch,CURLOPT_URL,$url);
    //curl_setopt($ch, CURLOPT_ENCODING ,"");
    $data = curl_exec($ch);
    //$data = utf8_decode(curl_exec($ch));
    curl_close($ch);
    return $data;
}
/**
 * Created by PhpStorm.
 * User: JuhaTapio
 * Date: 18.2.2015
 * Time: 10:27
 */
?>