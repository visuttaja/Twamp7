<? header('Content-Type: text/html;charset=UTF-8');
?>
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


	<?
    function get_first_file_name_of_extension($dir,$extensions)
    {


                  // directory to scan
        $directory = new DirectoryIterator($dir);

        // iterate
        foreach ($directory as $fileinfo) {

            // must be a file
            if ($fileinfo->isFile()) {

                // file extension

                $extension = strtolower(pathinfo($fileinfo->getFilename(), PATHINFO_EXTENSION));


                // check if extension match
                if (in_array($extension, $extensions)) {
                    // add to result
                   $path = $fileinfo->getPath();
                    $name= $fileinfo->getFilename();
                    $first_occurence =  $fileinfo->getFilename();
                     return $first_occurence;
                }
            }
        }
    }
    $exts[] = 'zip';
    $zip_name =get_first_file_name_of_extension('distro',$exts);
    $filename = $zip_name;
    $filenameEnc=  rawurlencode ( $filename );
    //$filename=htmlentities($filename);
    $link_name ='distro/'.$filenameEnc;
    echo '<a href='.$link_name.'>'.'<br>';
        echo 'Download TWAMP';
    echo '</a><br>';

	echo "Koko:" . human_filesize( filesize( 'distro/'.$filename ) ) . "<br>";
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




