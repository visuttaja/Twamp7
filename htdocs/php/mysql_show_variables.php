<!DOCTYPE html>
<html>
<meta charset="utf-8"/>
<head>
	<link rel="stylesheet" type="text/css" href="../styles/style_warm.css">
</head>
<body>
<a name="YLI">
	<a href="#ALI">Loppuun</a><br>


	<?php
	$mysqli = new mysqli( 'localhost', 'php', 'pww', 'mysql' );

	$result = $mysqli->query( "SHOW VARIABLES" );
	while ( $row = $result->fetch_assoc() ) {
		echo $row['Variable_name'] . ':' . $row['Value'] . "<br>\n";
	}
	?>

	<a name="ALI">
		<a href="#YLI">Alkuun</a><br>
	</a>

</body>


</html>
