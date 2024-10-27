<html>
<head>
    <title>Formulario de Matricula</title>
</head>
<body>
    <h2>Formulario:</h2>
    <form action="processa_matricula.php" method="post">
        <label for="nome">Nome:</label><br>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="idade">Idade:</label><br>
        <input type="number" id="idade" name="idade" required><br><br>

        <label for="curso">Curso:</label><br>
        <select id="curso" name="curso" required>
            <option value="qui">Quimica</option>
            <option value="pat">Analises Clinicas</option>
            <option value="ds">Desenvolvimento de Sistemas</option>
            <option value="aut">Automação Industrial</option>
	    <option value="elet">Eletronica</option>
        </select><br><br>

        <label for="ano">Ano de Ingresso:</label><br>
        <input type="number" id="ano" name="ano" required><br><br>

        <label for="email">E-mail:</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="telefone">Telefone:</label><br>
        <input type="tel" id="telefone" name="telefone" required><br><br>

        <input type="submit" value="Enviar">
    </form>
</body>
</html>
