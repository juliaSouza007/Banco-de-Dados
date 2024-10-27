<?php
$arquivo = "linhas.txt";

$file = fopen($arquivo, "r");

if ($file) {
    echo "<h2>Conteudo do arquivo '$arquivo':</h2><pre>";

    while (($linha = fgets($file)) !== false) {
        echo htmlspecialchars($linha);
    }

    echo "</pre>";
    
    fclose($file);
} else {
    echo "Erro ao abrir o arquivo.";
}
?>
