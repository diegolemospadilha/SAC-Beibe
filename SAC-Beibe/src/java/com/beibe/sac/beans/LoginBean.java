package com.beibe.sac.beans;

import java.io.Serializable;

public class LoginBean implements Serializable{
    
    private int id;
    
    private String nomeUsuario;
    
    private String tipoUsuario;
    
    public LoginBean(){
        
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
}
