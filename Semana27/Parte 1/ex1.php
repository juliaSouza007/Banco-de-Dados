<html>
<head>
    <title>Formulario de Dados Pessoais</title>
</head>
<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "GET") {
        // Coletando dados via método GET
        $nome = htmlspecialchars($_GET['nome']);
        $altura = floatval($_GET['altura']);
        $peso = floatval($_GET['peso']);
        $sexo = htmlspecialchars($_GET['sexo']);
        $idade = intval($_GET['idade']);
        
        echo "<h2>Dados Pessoais Recebidos:</h2>";
        echo "<p><strong>Nome:</strong> $nome</p>";
        echo "<p><strong>Altura:</strong> $altura metros</p>";
        echo "<p><strong>Peso:</strong> $peso kg</p>";
        echo "<p><strong>Sexo:</strong> $sexo</p>";
        echo "<p><strong>Idade:</strong> $idade anos</p>";
    } else {
    ?>
        <h2>Informe seus dados pessoais:</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="get">
            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" name="nome" required><br><br>
            
            <label for="altura">Altura (metros):</label><br>
            <input type="number" id="altura" name="altura" required><br><br>
            
            <label for="peso">Peso (kg):</label><br>
            <input type="number" id="peso" name="peso" required><br><br>
            
            <label for="sexo">Sexo:</label><br>
            <input type="radio" id="sexo_m" name="sexo" value="Masculino" required>
            <label for="sexo_m">Masculino</label>
            <input type="radio" id="sexo_f" name="sexo" value="Feminino" required>
            <label for="sexo_f">Feminino</label><br><br>
            
            <label for="idade">Idade:</label><br>
            <input type="number" id="idade" name="idade" required><br><br>
            
            <input type="submit" value="Enviar">
        </form>
    <?php
    }
    ?>
</body>
</html>
