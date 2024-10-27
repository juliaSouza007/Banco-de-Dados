<html>
<head>
    <title>Entrada de Senha</title>
</head>
<body>
    <?php
    $arquivo = "senha.txt";

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $senha = htmlspecialchars($_POST['senha']);

        file_put_contents($arquivo, $senha . PHP_EOL, FILE_APPEND);
        
        echo "<h2>Senha recebida e salva!</h2>";
    }
    ?>

    <h2>Digite sua senha:</h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="senha">Senha:</label><br>
        <input type="password" id="senha" name="senha" required><br><br>
        
        <input type="submit" value="Enviar">
    </form>
</body>
</html>
