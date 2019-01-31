package com.xavier.easymoneyapi.model;

public enum TipoEmprestimo {
	
	BANCARIO("Bancario"),
	EMPRESA("Empresa"),
	SINGULAR("Singular");
	
	private String descricao;
	
	TipoEmprestimo(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}
	
	

}
