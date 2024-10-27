<?php
function fatorial($num) {
    $resultado = 1;
    for ($i = 1; $i <= $num; $i++) {
        $resultado *= $i;
    }
    return $resultado;
}

$num = 6;
echo "Fatorial de $num eh: " . fatorial($num);
?>
