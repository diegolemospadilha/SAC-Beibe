/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beibe.sac.model;

/**
 *
 * @author lemospadilha
 */
public class Produto {
    private int idProduto;
    private String nomeProduto;
    private Categoria nomeCategoria;
    private double pesoProduto;
    public Produto() {
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public Categoria getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(Categoria nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    public double getPesoProduto() {
        return pesoProduto;
    }

    public void setPesoProduto(double pesoProduto) {
        this.pesoProduto = pesoProduto;
    }
}
