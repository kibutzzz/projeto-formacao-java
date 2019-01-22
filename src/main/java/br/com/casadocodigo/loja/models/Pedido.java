package br.com.casadocodigo.loja.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Pedido {

	private Integer id;
	private BigDecimal valor;
	private Calendar data;
	private List<Produto> produtos = new ArrayList<>();
	
	public Pedido() {};


	public Integer getId() {
		return id;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public Calendar getData() {
		return data;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

}
