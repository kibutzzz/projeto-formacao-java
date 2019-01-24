<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">
		<c:if test="${not empty sucesso }"> ${sucesso }<br>
		</c:if>

		<a href=${s:mvcUrl('UC#cadastrarNovoUsuario').build() }>Novo
			Usuario</a>
		<h1>Lista de Usuarios</h1>
		
		<c:if test="${not empty atualizado }"> <h2>${atualizado }</h2></c:if>
		<table>
			<thead>
				<th>Nome</th>
				<th>Email</th>
				<th>Roles</th>
				<th></th>
			</thead>
			<tbody>
				<c:forEach items="${usuarios }" var="usuario">
					<tr>
						<td>${usuario.nome }</td>
						<td>${usuario.email }</td>

						<td>[<c:forEach items="${usuario.roles }" var="role"
								varStatus="loop">
							${role.nome }
							<c:if test="${!loop.last }">,</c:if>

							</c:forEach>]
						</td>
						<td>
						<form:form action="${s:mvcUrl('UC#editar').arg(0, usuario.email).build() }" method="POST">
								<input type="image" src="${contextPath }resources/imagens/adicionar.png" 
									alt="Editar" title="Editar" />
							</form:form>	</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</section>

</tags:pageTemplate>
