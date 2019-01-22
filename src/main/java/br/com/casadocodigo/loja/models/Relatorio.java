package br.com.casadocodigo.loja.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Relatorio {

	private List<Produto> produtos = new ArrayList<Produto>();

	public Relatorio(List<Produto> produtos) {
		this.produtos = produtos;
	}

	public Date getDataGeracao() {
		return new Date();
	}

	public int getQuantidade() {
		return produtos.size();
	}

	public List<Produto> getProdutos() {
		return produtos;
	}
	
}
