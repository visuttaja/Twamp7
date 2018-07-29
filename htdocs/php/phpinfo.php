
<!DOCTYPE html>
<html>
<meta charset="utf-8"/>
<head><link rel="stylesheet" type="text/css" href="../styles/style_warm.css"></head>
<body>
<a name="YLI">
<a href="#ALI">Loppuun</a>


<?php phpinfo(); ?>

<a name="ALI">
<a href="#YLI">Alkuun</a><br>

    <?php
    $arr = get_loaded_extensions();
    foreach($arr as $ars => $val){

        echo   $ars.":".$val."<br>";

    }

    $a=0;

    ?>


</a>

</body>



</html>