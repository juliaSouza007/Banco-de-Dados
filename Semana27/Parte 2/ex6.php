<?php
function calcular_raizes_ref($a, $b, $c, &$x1, &$x2) {
    $delta = ($b * $b) - (4 * $a * $c);

    if ($delta < 0) {
        return "Sem raizes reais.";
    } else {
        $x1 = (-$b + sqrt($delta)) / (2 * $a);
        $x2 = (-$b - sqrt($delta)) / (2 * $a);
        return "Raizes calculadas!";
    }
}

$a = 1;
$b = -3;
$c = 2;

$x1 = 0;
$x2 = 0;

$resultado = calcular_raizes_ref($a, $b, $c, $x1, $x2);

echo $resultado . "<br>";
echo "x1 = $x1, x2 = $x2";
?>
