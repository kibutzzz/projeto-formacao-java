package br.com.casadocodigo.loja.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.models.Produto;
import br.com.casadocodigo.loja.models.Relatorio;

@Controller

public class RelatorioProdutosController {

	@Autowired
	private ProdutoDAO produtoDao;

	@RequestMapping(value="/relatorio-produtos", method=RequestMethod.GET)
	@ResponseBody
	public Relatorio gerarRelatorio(@RequestParam(value = "data", required=false) String dataString) {	
		
		List<Produto> produtos = produtoDao.listar();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar data  = Calendar.getInstance();
		try {			
			data.setTime(sdf.parse(dataString));
		} catch (Exception e) {			
			System.out.println("excessão com a data: " + e.getCause());	
			//retorna todos os produtos
			return new Relatorio(produtos);			
		}
			
		//Filtragem dos produtos pela data
		List<Produto> produtosFiltrados = new ArrayList<Produto>();		
		
		for(Produto produto : produtos) {
			if(produto.getDataLancamento().compareTo(data) >= 0){
				produtosFiltrados.add(produto);				
			}
		}
		
		return new Relatorio(produtosFiltrados);
		
		
		
	}

}
