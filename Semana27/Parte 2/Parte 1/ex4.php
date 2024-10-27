<html>
<head>
    <title>Questionario Coltecano</title>
</head>
<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nome = htmlspecialchars($_POST['nome']);
        $serie = intval($_POST['serie']);
        $sexo = htmlspecialchars($_POST['sexo']);
        $melhorColtec = htmlspecialchars($_POST['melhorColtec']);
        $atividades = isset($_POST['atividades']) ? $_POST['atividades'] : [];
        $curso = htmlspecialchars($_POST['curso']);

        echo "<h2>Sobre o coltecano:</h2>";
        echo "<p><strong>Nome:</strong> $nome</p>";
        echo "<p><strong>Serie:</strong> $serie</p>";
        echo "<p><strong>Curso:</strong> $curso</p>";
        echo "<p><strong>Sexo:</strong> $sexo</p>";
        echo "<p><strong>Melhor do Coltec:</strong> $melhorColtec</p>";
        
        echo "<p><strong>Atividades Extracurriculares:</strong></p>";
        if (!empty($atividades)) {
            foreach ($atividades as $atividade) {
                echo "<p>- $atividade</p>";
            }
        } else {
            echo "<p>Nenhuma atividade selecionada.</p>";
        }

        echo "<p><strong>Curso:</strong> $opcaoCurso</p>";
    } else {
    ?>
        <h2>Responda as perguntas abaixo:</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" name="nome" required><br><br>
            
            <label for="serie">Série (1º, 2º, 3º):</label><br>
            <input type="number" id="serie" name="serie" required><br><br>
            
            <label for="sexo">Sexo:</label><br>
            <input type="radio" id="sexo_m" name="sexo" value="Masculino" required>
            <label for="sexo_m">Masculino</label>
            <input type="radio" id="sexo_f" name="sexo" value="Feminino" required>
            <label for="sexo_f">Feminino</label><br><br>
            
            <label for="melhorColtec">Melhor do Coltec:</label><br>
            <input type="text" id="melhorColtec" name="melhorColtec" required><br><br>

            <label for="atividades">Atividades Extracurriculares:</label><br>
            <input type="checkbox" id="esportes" name="atividades[]" value="Esportes">
            <label for="esportes">Esportes</label><br>
            <input type="checkbox" id="redacao" name="atividades[]" value="redacao">
            <label for="redacao">Plantao de Redacao</label><br>
            <input type="checkbox" id="leituratec" name="atividades[]" value="leituratec">
            <label for="leituratec">Leituratec</label><br><br>

            <label for="curso">Curso:</label><br>
            <select id="curso" name="curso" required>
                <option value="ds">Desenvolvimento de Sistemas</option>
                <option value="qui">Quimica</option>
                <option value="elet">Eletronica</option>
                <option value="pat">Analises Clinicas</option>
		<option value="aut">Automacao Industrial</option>
            </select><br><br>
            
            <input type="submit" value="Enviar">
        </form>
    <?php
    }
    ?>
</body>
</html>
