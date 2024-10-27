<?php
$arquivo = "nomes.txt";

$nomes = [
    "Ana Julaia",
    "Heichy",
    "Dudetch",
    "Isa Ramox",
    "Waltin",
    "Pudjyas",
    "Helombra",
    "Brunett",
    "Sant'ana",
    "Big Giovanna"
];

$file = fopen($arquivo, "w");

if ($file) {
    foreach ($nomes as $nome) {
        fwrite($file, $nome . "\n");
    }

    fclose($file);
    echo "nomes gravados no arquivo '$arquivo'.";
} else {
    echo "Erro ao abrir o arquivo.";
}
?>
