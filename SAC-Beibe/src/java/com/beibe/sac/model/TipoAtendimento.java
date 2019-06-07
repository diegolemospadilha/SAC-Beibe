package com.beibe.sac.model;

import java.io.Serializable;

public class TipoAtendimento implements Serializable{
    private int idTipoAtendimento;
    private String nomeTipoAtendimento;

    public TipoAtendimento() {
    }

    public int getIdTipoAtendimento() {
        return idTipoAtendimento;
    }

    public void setIdTipoAtendimento(int idTipoAtendimento) {
        this.idTipoAtendimento = idTipoAtendimento;
    }

    public String getNomeTipoAtendimento() {
        return nomeTipoAtendimento;
    }

    public void setNomeTipoAtendimento(String nomeTipoAtendimento) {
        this.nomeTipoAtendimento = nomeTipoAtendimento;
    }
}
