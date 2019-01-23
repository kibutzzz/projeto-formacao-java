<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate
	titulo="Livros de Java, Android, iPhone, Ruby, PHP e muito mais ....">

	<section id="index-section" class="container middle">

		<h1>Cadastro de Usuário</h1>
		<%-- 		${s:mvcUrl('UC#gravar').build() } --%>
		<form:form action="${s:mvcUrl('UC#gravar').build() }" method="post" commandName="usuario">
			<div class="form-group">
				<label>Nome</label> <form:input path="nome" class="form-control" />
				<form:errors path="nome"></form:errors>
			</div>
			<div class="form-group">
				<label>Email</label> <form:input type="email" path="email" class="form-control" />
				<form:errors path="email"></form:errors>

			</div>
			<div class="form-group">
				<label>Senha</label> <form:password path="senha"
					class="form-control" />
				<form:errors path="senha"></form:errors>

			</div>
			<div class="form-group">
				<label>Senha repetida</label> <form:password  path="confirmaSenha"
					class="form-control" />
				<form:errors path="confirmaSenha"></form:errors>

			</div>
			
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>


	</section>

</tags:pageTemplate>
