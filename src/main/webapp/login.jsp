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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Serwis samochodowy</title>
</head>
<head>

<meta name="description" content="Serwis samochodowy">
<meta name="author" content="Bartosz Kyzioł">

<title>Logowanie</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

	<div class="content">

		<div class="col-sm-4 col-sm-offset-4">
			<h2 class="form-signin-heading text-center">Zaloguj się</h2>
			<form method="POST" action="${contextPath}/logowanie"
				class="form-horizontal">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <span>${message}</span>
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label for="inputLogin" class="col-sm-2 control-label">Login:</label>
					<div class="col-sm-10">
						<input name="username" type="text" class="form-control"
							placeholder="login" autofocus="true" id="inputLogin" />
					</div>
				</div>

				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label for="inputPassword" class="col-sm-2 control-label">Hasło:</label>
					<div class="col-sm-10">
						<input name="password" type="password" class="form-control"
							placeholder="hasło" id="inputPassword" />
					</div>
				</div>

				<div class="form-group">
					<div class="text-center">
						<button class="btn btn-primary btn-lg" type="submit">Zaloguj się</button>
					</div>
					<div class="text-center">
						<a href="${contextPath}/rejestracja">Utwórz konto</a>
					</div>
				</div>

			</form>
		</div>
	</div>

	<script src="${contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>