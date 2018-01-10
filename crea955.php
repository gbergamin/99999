<?php

if (($handle = fopen($argv[1], "r")) !== FALSE)

 {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE)
	 {
		$line955="955    \$b ".substr($data[1],1).$data[2]."000".$data[3]." \$v ".$data[9]." \$3 ".rtrim($data[5]).".".rtrim($data[6]);
		print $line955."\n";

	}
		
}



fclose($handle);

/*
#versione 2 del 8.1.2017
0_______________BVE0443169
1_______________ CR
2_______________PER
3_______________104551
4_______________1931
5_______________A.UFF
6_______________5.33
7_______________
8_______________
9_______________Provincia di Bologna(1930)
*/


		
?>

