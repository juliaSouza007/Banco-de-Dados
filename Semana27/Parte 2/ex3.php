<?php
function fatorial_rec($num) {
    if ($num <= 1) {
        return 1;
    }
    return $num * fatorial_rec($num - 1);
}

$num = 5;
echo "Fatorial de $num eh: " . fatorial_rec($num);
?>
