<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> --%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->
<%-- 	<spring:hasBindErrors name="product"> --%>
<!-- 		<ul> -->
<%-- 			<c:forEach var="error" items="${errors.allErrors}"> --%>
<%-- 				<li>${error.code}-${error.field}</li> --%>
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<%-- 	</spring:hasBindErrors> --%>
<%-- 	<form:form action="${spring:mvcUrl("saveProduct").build()}" method="post"  commandName="product" enctype="multipart/form-data"> --%>
<!-- 		<div> -->
<!-- 			<label for="titulo">Titulo</label> -->
<%-- 			<form:input path="title" /> --%>
<%-- 			<form:errors path="title" /> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label for="descricao">Descrição</label> -->
<%-- 			<form:textarea path="description" rows="10" cols="20" /> --%>
<%-- 			<form:errors path="description" /> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label for="numeroPaginas">Número de paginas</label> -->
<%-- 			<form:input path="pages" /> --%>
<%-- 			<form:errors path="pages" /> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label for="releaseDate">Data de lançamento</label> -->
<%-- 			<form:input path="releaseDate" type="date" /> --%>
<%-- 			<form:errors path="releaseDate" /> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label for="summary">Sumario do livro</label> <input type="file" -->
<!-- 				name="summary" /> -->
<%-- 			<form:errors path="summaryPath" /> --%>
<!-- 			<div> -->
<%-- 				<c:forEach items="${bookTypes}" var="bookType" varStatus="status"> --%>
<!-- 					<div> -->
<%-- 						<label for="preco_${bookType}">${bookType}</label> <input --%>
<%-- 							type="text" name="prices[${status.index}].value" --%>
<%-- 							id="preco_${bookType}" /> <input type="hidden" --%>
<%-- 							name="prices[${status.index}].bookType" value="${bookType}" /> --%>
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
<!-- 			<div> -->
<!-- 				<label for="releaseDate">Data de lançamento</label> -->
<%-- 				<form:input path="releaseDate" type="date" /> --%>
<%-- 				<form:errors path="releaseDate" /> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<input type="submit" value="Enviar"> -->
<!-- 		</div> -->
<%-- 	</form:form> --%>

<!-- </body> -->
<!-- </html> -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de produtos</title>
</head>
<body>
	<form action="${spring:mvcUrl("saveProduct").build()}" method="post">
		<div>
			<label for="title">Titulo</label> <input type="text" name="title"
				id="title" />
		</div>
		<div>
			<label for="description">Descrição</label>
			<textarea rows="10" cols="20" name="description" id="description"></textarea>
		</div>
		<div>
			<label for="pages">Número de paginas</label> <input type="text"
				name="pages" id="pages" />
		</div>

		<div>
			<c:forEach items="${types}" var="bookType" varStatus="status">
				<div>
					<label for="price_${bookType}">${bookType}</label> <input
						type="text" name="prices[${status.index}].value"
						id="price_${bookType}" /> <input type="hidden"
						name="prices[${status.index}].bookType" value="${bookType}" />
				</div>
			</c:forEach>
		</div>

		<div>
			<div>
				<label for="price_EBOOK">EBOOK</label> <input type="text"
					name="prices[0].value" id="price_EBOOK" /> <input type="hidden"
					name="prices[0].bookType" value="EBOOK" />
			</div>
			<div>
				<label for="price_PRINTED">IMPRESSO</label> <input type="text"
					name="prices[1].value" id="price_PRINTED" /> <input type="hidden"
					name="prices[1].bookType" value="IMPRESSO" />
			</div>
			<div>
				<label for="price_COMBO">COMBO</label> <input type="text"
					name="prices[2].value" id="price_COMBO" /> <input type="hidden"
					name="prices[2].bookType" value="COMBO" />
			</div>
		</div>
		<div>
			<input type="submit" value="Enviar">
		</div>
	</form>

	<spring:hasBindErrors name="product">
		<ul>
			<c:forEach var="error" items="${errors.allErrors}">
				<li>${error.code}</li>
			</c:forEach>
		</ul>
	</spring:hasBindErrors>

</body>
</html>