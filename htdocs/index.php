<!DOCTYPE html>
<html>
<meta charset="utf-8"/>
<head><link rel="stylesheet" type="text/css" href="styles/style_warm.css"></head>
<body>

<div style="margin:0 auto; text-align:left; width:500px;">

    <a href="wordpress/index.php">Wordpress</a><br><br>
	<a href="adminer/index.php">Adminer</a><br><br>
    <a href="php/phpinfo.php">PHPINFO</a><br><br>

    <a href="php/mysql_show_variables.php">
        MySQL Variables
    </a><br><br>
    <a href="distro/twamp7.zip">
        Download TWAMP
    </a><br>

	<?

	$filename = 'distro/twamp7.zip';
	echo "Koko:" . human_filesize( filesize( $filename ) ) . "<br>";
	echo muokattu( $filename );

	?>


</div>
</body>



</html>

<?php
function human_filesize( $bytes, $decimals = 2 ) {
	$sz     = 'BKMGTP';
	$factor = floor( ( strlen( $bytes ) - 1 ) / 3 );

	return sprintf( "%.{$decimals}f", $bytes / pow( 1024, $factor ) ) . @$sz[ $factor ];
}

function muokattu( $filename ) {
	$ret = "";
	if ( file_exists( $filename ) ) {
		$ret = " muokattu: " . date( "F d Y H:i:s.", filemtime( $filename ) );
	}

	return $ret;
}

?>




