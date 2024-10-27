<?php
function fatorial_it($num) {
    $resultado = 1;
    for ($i = 1; $i <= $num; $i++) {
        $resultado *= $i;
    }
    return $resultado;
}

$num = 5;
echo "Fatorial de $num eh: " . fatorial_it($num);
?>