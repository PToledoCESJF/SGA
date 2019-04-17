<?php

class Professor {
    private $idProfessor;
    private $nome;
    private $cargo;
    
    function __construct($idProfessor, $nome, $cargo) {
        $this->idProfessor = $idProfessor;
        $this->nome = $nome;
        $this->cargo = $cargo;
    }

    
    function getIdProfessor() {
        return $this->idProfessor;
    }

    function getNome() {
        return $this->nome;
    }

    function getCargo() {
        return $this->cargo;
    }


}
