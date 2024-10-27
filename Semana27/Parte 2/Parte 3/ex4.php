<?php
$arquivo = "linhas.txt";

$file = fopen($arquivo, "r");

if ($file) {
    $tamanhoArquivo = filesize($arquivo);

    $conteudo = fread($file, $tamanhoArquivo);

    echo "<h2>Conteudo do arquivo '$arquivo':</h2><pre>";
    echo htmlspecialchars($conteudo);
    echo "</pre>";

    fclose($file);
} else {
    echo "Erro ao abrir o arquivo.";
}
?>
