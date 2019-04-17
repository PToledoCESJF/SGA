<?php
include_once "estrutura/Template.php";
require_once "./db/ProfessorDAO.php";
require_once "./classes/Professor.php";

$template = new Template();
$object = new ProfessorDAO();

$template->header();
$template->sidebar();
$template->navbar();

// Verificar se foi enviando dados via POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = (isset($_POST["id"]) && $_POST["id"] != null) ? $_POST["id"] : "";
    $nome = (isset($_POST["nome"]) && $_POST["nome"] != null) ? $_POST["nome"] : "";
    $cargo = (isset($_POST["cargo"]) && $_POST["cargo"] != null) ? $_POST["cargo"] : "";
} else if (!isset($id)) {
    // Se não se não foi setado nenhum valor para variável $id
    $id = (isset($_GET["id"]) && $_GET["id"] != null) ? $_GET["id"] : "";
    $nome = NULL;
    $cargo = NULL;
}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "upd" && $id != "") {
    $professor = new Professor($idProfessor, '', '');

    $resultado = $object->atualizar($professor);
    $nome = $resultado->getNome();
    $cargo = $resultado->getCargo();
}
if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "save" && $nome != "") {
    $professor = new Professor($idProfessor, $nome, $cargo);
    $msg = $object->salvar($professor);
    $idProfessor = null;
    $nome = null;
    $cargo = null;
}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "del" && $id != "") {
    $professor = new Professor($idProfessor, '', '');
    $msg = $object->remover($professor);
    $idProfessor = null;
}
?>

<div class='content' xmlns="http://www.w3.org/1999/html">
    <div class='container-fluid'>
        <div class='row'>
            <div class='col-md-12'>
                <div class='card'>
                    <div class='header'>
                        <h4 class='title'>Professores</h4>
                        <p class='category'>Lista de professores do sistema</p>

                    </div>
                    <div class='content table-responsive'>

                        <form action="?act=save" method="POST" name="form1" >
                            <hr>
                                <i class="ti-save"></i>
                                <input type="hidden" size="5" name="id" value="<?php
                                // Preenche o id no campo id com um valor "value"
                                echo (isset($id) && ($id != null || $id != "")) ? $id : '';
                                ?>" />
                                Nome:
                                <input type="text" size="50" name="nome" value="<?php
                                // Preenche o nome no campo nome com um valor "value"
                                echo (isset($nome) && ($nome != null || $nome != "")) ? $nome : '';
                                ?>" />
                                Cargo:
                                <select name="cargo">
                                    <option value="PROFESSOR ASSISTENTE I" <?php if (isset($cargo) && $cargo == "PROFESSOR ASSISTENTE I") echo 'selected' ?>>PROFESSOR ASSISTENTE I</option>
                                    <option value="PROFESSOR ASSISTENTE II" <?php if (isset($cargo) && $cargo == "PROFESSOR ASSISTENTE II") echo 'selected' ?>>PROFESSOR ASSISTENTE II</option>
                                    <option value="PROFESSOR ADJUNTO I" <?php if (isset($cargo) && $cargo == "PROFESSOR ADJUNTO I") echo 'selected' ?> >PROFESSOR ADJUNTO I</option>
                                    <option value="PROFESSOR ADJUNTO II" <?php if (isset($cargo) && $cargo == "PROFESSOR ADJUNTO II") echo 'selected' ?>>PROFESSOR ADJUNTO II</option>
                                    <option value="PROFESSOR TITUTLAR I" <?php if (isset($cargo) && $cargo == "PROFESSOR TITULAR I") echo 'selected' ?>>PROFESSOR TITUTLAR I</option>
                                    <option value="PROFESSOR TITUTLAR II" <?php if (isset($cargo) && $cargo == "PROFESSOR TITULAR II") echo 'selected' ?>>PROFESSOR TITUTLAR II</option>
                                    <option value="PROFESSOR TITUTLAR III" <?php if (isset($cargo) && $cargo == "PROFESSOR TITULAR III") echo 'selected' ?>>PROFESSOR TITUTLAR III</option>
                                </select>
                                <input type="submit" VALUE="Cadastrar"/>
                            <hr>
                        </form>

                        <?php
                        echo (isset($msg) && ($msg != null || $msg != "")) ? $msg : '';

                        //chamada a paginação
                        $object->tabelapaginada();
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
$template->footer();
?>



<?php
/**
 * Created by PhpStorm.
 * User: tassio
 * Date: 09/01/2018
 * Time: 13:33
 */
require_once 'db/conexao.php';

//endereço atual da página
$endereco = $_SERVER ['PHP_SELF'];

/* Constantes de configuração */
define('QTDE_REGISTROS', 3);
define('RANGE_PAGINAS', 1);

/* Recebe o número da página via parâmetro na URL */
$pagina_atual = (isset($_GET['page']) && is_numeric($_GET['page'])) ? $_GET['page'] : 1;

/* Calcula a linha inicial da consulta */
$linha_inicial = ($pagina_atual - 1) * QTDE_REGISTROS;

/* Instrução de consulta para paginação com MySQL */
$sql = "SELECT idProfessor, Nome, Cargo FROM Professor LIMIT {$linha_inicial}, " . QTDE_REGISTROS;
$statement = $pdo->prepare($sql);
$statement->execute();
$dados = $statement->fetchAll(PDO::FETCH_OBJ);

/* Conta quantos registos existem na tabela */
$sqlContador = "SELECT COUNT(*) AS total_registros FROM Professor";
$statement = $pdo->prepare($sqlContador);
$statement->execute();
$valor = $statement->fetch(PDO::FETCH_OBJ);

/* Idêntifica a primeira página */
$primeira_pagina = 1;

/* Cálcula qual será a última página */
$ultima_pagina = ceil($valor->total_registros / QTDE_REGISTROS);

/* Cálcula qual será a página anterior em relação a página atual em exibição */
$pagina_anterior = ($pagina_atual > 1) ? $pagina_atual - 1 : 0;

/* Cálcula qual será a pŕoxima página em relação a página atual em exibição */
$proxima_pagina = ($pagina_atual < $ultima_pagina) ? $pagina_atual + 1 : 0;

/* Cálcula qual será a página inicial do nosso range */
$range_inicial = (($pagina_atual - RANGE_PAGINAS) >= 1) ? $pagina_atual - RANGE_PAGINAS : 1;

/* Cálcula qual será a página final do nosso range */
$range_final = (($pagina_atual + RANGE_PAGINAS) <= $ultima_pagina ) ? $pagina_atual + RANGE_PAGINAS : $ultima_pagina;

/* Verifica se vai exibir o botão "Primeiro" e "Pŕoximo" */
$exibir_botao_inicio = ($range_inicial < $pagina_atual) ? 'mostrar' : 'esconder';

/* Verifica se vai exibir o botão "Anterior" e "Último" */
$exibir_botao_final = ($range_final > $pagina_atual) ? 'mostrar' : 'esconder';
?>


                                    <?php
                                    $template->footer();
                                    ?>            