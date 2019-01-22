<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">
		
		<h1>Lista de Pedidos Atuais</h1>

		<table>
			<thead>
				<th>ID</th>
				<th>Valor</th>
				<th>Data Pedido</th>
				<th>Titulos</th>
			</thead>
			<tbody>
				<c:forEach items="${pedidos }" var="pedido">
					<tr>
						<td>${pedido.id }</td>
						<td>${pedido.valor }</td>
						<td><fmt:formatDate value="${pedido.data.time }" pattern="dd/MM/yyyy"/></td>
						<td><c:forEach items="${pedido.produtos }" var="produto" varStatus="loop">
								${produto.titulo }
								${!loop.last ? ',' : ''}
							</c:forEach></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</section>

</tags:pageTemplate>