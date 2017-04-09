<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html">

<meta name="description" content="Serwis samochodowy">
<meta name="author" content="Bartosz Kyzioł">
<meta name="csrf" content="${_csrf.token}"/>

<title>Twoje konto</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>



	<div class="content">
		<div class="col-md-4 col-md-offset-4">

			<h3>Witaj ${user.login}!</h3>

			<h4>Twoje pojazdy:</h4>
			<div id="cars"></div>
			
			<div class="form-horizontal">

				<div class="form-group">
					<label for="inputBrand" class="col-sm-2 control-label">Marka:</label>
					<div class="col-sm-9">
						<input id="brand" type="text" class="form-control"
							placeholder="marka" autofocus="true" id="inputBrand" />
					</div>
				</div>

				<div class="form-group">
					<label for="inputModel" class="col-sm-2 control-label">Model:</label>
					<div class="col-sm-9">
						<input id="model" type="text" class="form-control"
							placeholder="model" autofocus="true" id="inputModel" />
					</div>
				</div>

				<div class="form-group">
					<label for="inputRegNr" class="col-sm-2 control-label">Nr&nbsprej.:</label>
					<div class="col-sm-9">
						<input id="registration_nr" type="text" class="form-control"
							placeholder="numer rejestracyjny" autofocus="true"
							id="inputRegNr" />
					</div>
				</div>

				<div class="form-group">
					<div class="text-center">
						<button id="add-car" class="btn btn-primary" type="submit">Dodaj
							pojazd</button>
					</div>
				</div>

			</div>


		</div>
	</div>

	<script src="${contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/account-scripts.js"></script>



</body>
</html>