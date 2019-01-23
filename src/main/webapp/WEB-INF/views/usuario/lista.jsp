<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">
		<c:if test="${not empty sucesso }"> ${sucesso }<br></c:if>
	
		<a href=${s:mvcUrl('UC#cadastrarNovoUsuario').build() }>Novo
			Usuario</a>
		<h1>Lista de Usuarios</h1>
		<table>
			<thead>
				<th>Nome</th>
				<th>Email</th>
			</thead>
			<tbody>
				<c:forEach items="${usuarios }" var="usuario">
					<tr>
						<td>${usuario.nome }</td>
						<td>${usuario.email }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</section>

</tags:pageTemplate>
