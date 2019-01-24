<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Editar Usuario">

	<section id="index-section" class="container middle">

		<h1>Cadastro de permissões para ${usuario.nome }</h1>
		<form:form action="${s:mvcUrl('UC#atualizarRole').build() }"
			method="post">
			<input type="hidden" name="email" value="${usuario.email }"/>
		Permissões:
		<c:forEach items="${roles }" var="role">
				<label for="${role.nome }">${role.nome }</label>
				<input id="${role.nome }" type="checkbox" name="roles" value="${role.nome }"
					<c:forEach items="${usuario.roles }" var="userRole">
					
					<c:if test="${userRole.nome.equals(role.nome) }">checked</c:if>
				</c:forEach> />

			</c:forEach>
			<br>
			<button type="submit" class="btn btn-primary">Atualizar</button>
		</form:form>
	</section>

</tags:pageTemplate>