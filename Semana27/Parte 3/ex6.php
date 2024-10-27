<?php
$url = "http://newton.coltec.ufmg.br/fantini/php/teste1.php";

$conteudo = file_get_contents($url);

if ($conteudo !== false) {
    echo "<pre>" . htmlspecialchars($conteudo) . "</pre>";
} else {
    echo "Nao foi possivel ler o conteudo da pagina web: $url.";
}
?>
