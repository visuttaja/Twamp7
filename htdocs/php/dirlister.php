<?php
function kansioListausOptioiksi($kansio,$extensions)
{
// audio tunnisteet


// init result
    $audiofiles = array();

// directory to scan
    $directory = new DirectoryIterator($kansio);

// iterate
    foreach ($directory as $fileinfo) {
        // must be a file
        if ($fileinfo->isFile()) {
            // file extension
            $extension = strtolower(pathinfo($fileinfo->getFilename(), PATHINFO_EXTENSION));
            // check if extension match
            if (in_array($extension, $extensions)) {
                // add to result
                $audiofiles[] = $fileinfo->getPath()."/".$fileinfo->getFilename();
            }
        }
    }




echo '<select class="" id="alarm_selection" size="1" name="alarmnames">';

foreach($audiofiles as $value => $caption)

	   {

           echo "<option  value=\"$value\">$caption </option>";

	   }


echo '</select>';



}
?>
