package com.xavier.easymoneyapi.model;

public enum TipoTransacao {
	
	DISPESA("Dispesa"),
	RECEITA("Receita");
	
	private String descricao;
	
	TipoTransacao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}
	
	

}
