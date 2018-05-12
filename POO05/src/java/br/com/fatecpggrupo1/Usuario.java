/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpggrupo1;

import java.time.LocalDateTime;

/**
 *
 * @author Tiago
 */
public class Usuario {
    private String nome;
    private LocalDateTime dataTeste;

    public LocalDateTime getDataTeste() {
        return dataTeste;
    }

    public void setDataTeste(LocalDateTime dataTeste) {
        this.dataTeste = dataTeste;
    }
    private double resultadoTeste;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getResultadoTeste() {
        return resultadoTeste;
    }

    public void setResultadoTeste(double resultadoTeste) {
        this.resultadoTeste = resultadoTeste;
    }
       
}