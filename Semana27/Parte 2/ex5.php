<?php
function calcular_raizes($a, $b, $c) {
    $delta = ($b * $b) - (4 * $a * $c);

    if ($delta < 0) {
        return "Sem raizes reais.";
    } else {
        $x1 = (-$b + sqrt($delta)) / (2 * $a);
        $x2 = (-$b - sqrt($delta)) / (2 * $a);
        return "Raizes: x1 = $x1, x2 = $x2";
    }
}

$a = 1;
$b = -3;
$c = 2;

echo calcular_raizes($a, $b, $c);
?>
