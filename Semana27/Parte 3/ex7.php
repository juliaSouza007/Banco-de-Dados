<?php
$arquivo = "chaves.txt";

$file = fopen($arquivo, "w");

if ($file) {
    for ($i = 1; $i <= 10; $i++) {
        $chave = "chave" . rand(1, 100); // chave aleatória
        $valor = "valor" . rand(1, 100); // valor aleatório

        fwrite($file, "$chave:$valor\n");
    }
    
    fclose($file);
    echo "linhas gravadas no arquivo '$arquivo'.";
} else {
    echo "Erro ao abrir o arquivo.";
}
?>
