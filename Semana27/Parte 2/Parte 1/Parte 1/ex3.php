<html>
<head>
    <title>Calculadora Simples</title>
</head>
<body>
    <h2>Calculadora</h2>
    
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $num1 = floatval($_POST['num1']);
        $num2 = floatval($_POST['num2']);
        $operacao = $_POST['operacao'];
        $resultado = "";

        switch ($operacao) {
            case 'soma':
                $resultado = $num1 + $num2;
                $op = "Soma";
                break;
            case 'sub':
                $resultado = $num1 - $num2;
                $op = "Subtracao";
                break;
            case 'mult':
                $resultado = $num1 * $num2;
                $op = "Multiplicacao";
                break;
            case 'div':
                if ($num2 != 0) {
                    $resultado = $num1 / $num2;
                    $op = "Divisao";
                } else {
                    $resultado = "Error 404: Divisao por zero!";
                }
                break;
            default:
                $resultado = "Operacao invalida!";
        }

        echo "<h3>Resultado da $op:</h3>";
        echo "<p><strong> $num1 $operacao $num2 = $resultado</strong></p>";
    }
    ?>

    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="num1">Primeiro numero:</label><br>
        <input type="number" step="any" id="num1" name="num1" required><br><br>

        <label for="num2">Segundo numero:</label><br>
        <input type="number" step="any" id="num2" name="num2" required><br><br>

        <label for="operacao">Operacao:</label><br>
        <input type="radio" id="soma" name="operacao" value="soma" required>
        <label for="soma">Soma (+)</label><br>
        
        <input type="radio" id="sub" name="operacao" value="sub" required>
        <label for="sub">Subtracao (-)</label><br>
        
        <input type="radio" id="mult" name="operacao" value="mult" required>
        <label for="mult">Multiplicacao (×)</label><br>
        
        <input type="radio" id="div" name="operacao" value="div" required>
        <label for="div">Divisao (÷)</label><br><br>

        <input type="submit" value="Calcular">
    </form>
</body>
</html>
