<?php
$arquivo = "lines.txt";

$file = fopen($arquivo, "w");

if ($file) {
    for ($i = 1; $i <= 10; $i++) {
        fwrite($file, "Linha $i\n");
    }
    
    fwrite($file, "mais uma linha...<br>");

    fclose($file);
    echo "Arquivo '$arquivo' criado com sucesso!";
} else {
    echo "Erro ao abrir o arquivo.";
}
?>
