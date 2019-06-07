package com.beibe.sac.model;

import java.io.Serializable;

/**
 *
 * @author lemospadilha
 */
public class Categoria implements Serializable{
    private int idCategoria;
    private String nomeCategoria;
    
    public Categoria(){
        
    }
    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }
    
    
}
