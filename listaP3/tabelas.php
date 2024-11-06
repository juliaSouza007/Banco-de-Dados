<?php

// Conexão com o banco de dados
$host = "127.0.0.1";
$dbname = 'a2023952624@teiacoltec.org';
$name = 'a2023952624@teiacoltec.org';
$senha = '--------';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $name, $senha);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erro ao conectar: " . $e->getMessage());
}

// Consulta para listar todos os estados na caixa de selecao
$sqlEstados = "SELECT DISTINCT `Sigla Estado` FROM municipiosBrasil";
$stmtEstados = $pdo->prepare($sqlEstados);
$stmtEstados->execute();
$estados = $stmtEstados->fetchAll(PDO::FETCH_ASSOC);

// Consulta para as 10 cidades mais populosas do Brasil
$sqlTop10Cidades = "SELECT * FROM municipiosBrasil 
                    WHERE Municipio NOT LIKE 'Brasil'
                    ORDER BY Populacao DESC LIMIT 10";
$stmtTop10Cidades = $pdo->prepare($sqlTop10Cidades);
$stmtTop10Cidades->execute();
$top10Cidades = $stmtTop10Cidades->fetchAll(PDO::FETCH_ASSOC);

// Consulta para a tabela de capitais
$sqlCapitais = "SELECT Estado, `Sigla Estado`, Municipio AS Capital, Populacao 
                FROM municipiosBrasil
                WHERE Municipio IN (
                    'Rio Branco', 'Maceió', 'Macapá', 'Manaus', 'Salvador', 
                    'Fortaleza', 'Brasília', 'Vitória', 'Goiânia', 'São Luís', 
                    'Cuiabá', 'Campo Grande', 'Belo Horizonte', 'Belém', 
                    'João Pessoa', 'Curitiba', 'Recife', 'Teresina', 'Rio de Janeiro', 
                    'Natal', 'Porto Alegre', 'Porto Velho', 'Boa Vista', 
                    'Florianópolis', 'São Paulo', 'Aracaju', 'Palmas'
                )";
$stmtCapitais = $pdo->prepare($sqlCapitais);
$stmtCapitais->execute();
$capitais = $stmtCapitais->fetchAll(PDO::FETCH_ASSOC);

// Consulta para a população de cada estado
$sqlPopEstado = "SELECT Estado, `Sigla Estado`, SUM(Populacao) AS PopulacaoTotal 
                 FROM municipiosBrasil 
                 GROUP BY Estado, `Sigla Estado`";
$stmtPopEstado = $pdo->prepare($sqlPopEstado);
$stmtPopEstado->execute();
$popEstado = $stmtPopEstado->fetchAll(PDO::FETCH_ASSOC);

// Verifica se um estado foi selecionado
$estadoSelecionado = $_POST['estado'] ?? null;
if ($estadoSelecionado) {
    // Consulta para as 10 cidades mais populosas do estado selecionado
    $sqlTop10Estado = "SELECT * FROM municipiosBrasil 
                       WHERE `Sigla Estado` = :estado 
                       ORDER BY Populacao DESC LIMIT 10";
    $stmtTop10Estado = $pdo->prepare($sqlTop10Estado);
    $stmtTop10Estado->bindParam(':estado', $estadoSelecionado);
    $stmtTop10Estado->execute();
    $top10CidadesEstado = $stmtTop10Estado->fetchAll(PDO::FETCH_ASSOC);
}
?>

<html>
<head>
    <title>Consultas - Tabela de Municípios no Brasil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Listar Tabela de Municípios no Brasil - 2022</h2>
    
    <!-- Caixa de seleção para escolher o estado -->
    <form method="POST" action="">
        <label for="estado">Escolha um estado:</label>
        <select name="estado" id="estado">
            <option value="">Selecione um estado</option>
            <?php foreach ($estados as $estado): ?>
                <option value="<?php echo $estado['Sigla Estado']; ?>" <?php if ($estadoSelecionado == $estado['Sigla Estado']) echo 'selected'; ?>>
                    <?php echo $estado['Sigla Estado']; ?>
                </option>
            <?php endforeach; ?>
        </select>
        <button type="submit">Consultar</button>
    </form>

    <!-- Tabela das 10 cidades mais populosas do estado selecionado -->
    <?php if ($estadoSelecionado && $top10CidadesEstado): ?>
        <h3>10 Cidades mais populosas de <?php echo htmlspecialchars($estadoSelecionado); ?></h3>
        <table>
            <tr>
                <th>Posição</th>
                <th>Município</th>
                <th>População</th>
            </tr>
            <?php foreach ($top10CidadesEstado as $cidade): ?>
            <tr>
                <td><?php echo htmlspecialchars($cidade['Posicao']); ?></td>
                <td><?php echo htmlspecialchars($cidade['Municipio']); ?></td>
                <td><?php echo htmlspecialchars($cidade['Populacao']); ?></td>
            </tr>
            <?php endforeach; ?>
        </table>
    <?php endif; ?>

    <!-- Tabela das 10 cidades mais populosas do Brasil -->
    <h3>10 Cidades mais populosas do Brasil</h3>
    <table>
        <tr>
            <th>Posição</th>
            <th>Município</th>
            <th>Estado</th>
            <th>População</th>
        </tr>
        <?php foreach ($top10Cidades as $cidade): ?>
        <tr>
            <td><?php echo htmlspecialchars($cidade['Posicao']); ?></td>
            <td><?php echo htmlspecialchars($cidade['Municipio']); ?></td>
            <td><?php echo htmlspecialchars($cidade['Sigla Estado']); ?></td>
            <td><?php echo htmlspecialchars($cidade['Populacao']); ?></td>
        </tr>
        <?php endforeach; ?>
    </table>

    <!-- Tabela com as capitais -->
    <h3>Capitais dos estados do Brasil</h3>
    <table>
        <tr>
            <th>Estado</th>
            <th>Sigla</th>
            <th>Capital</th>
            <th>População</th>
        </tr>
        <?php foreach ($capitais as $capital): ?>
        <tr>
            <td><?php echo htmlspecialchars($capital['Estado']); ?></td>
            <td><?php echo htmlspecialchars($capital['Sigla Estado']); ?></td>
            <td><?php echo htmlspecialchars($capital['Capital']); ?></td>
            <td><?php echo htmlspecialchars($capital['Populacao']); ?></td>
        </tr>
        <?php endforeach; ?>
    </table>

    <!-- Tabela com a população de cada estado -->
    <h3>População Total por Estado</h3>
    <table>
        <tr>
            <th>Estado</th>
            <th>Sigla</th>
            <th>População Total</th>
        </tr>
        <?php foreach ($popEstado as $estado): ?>
        <tr>
            <td><?php echo htmlspecialchars($estado['Estado']); ?></td>
            <td><?php echo htmlspecialchars($estado['Sigla Estado']); ?></td>
            <td><?php echo htmlspecialchars($estado['PopulacaoTotal']); ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>

