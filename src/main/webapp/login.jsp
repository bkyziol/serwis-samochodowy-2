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

<title>Logowanie</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/login.css" rel="stylesheet">

</head>

<body>

	<div class="content">

		<div id="login-div" class="col-sm-4 col-sm-offset-4">
			<h3 class="form-signin-heading text-center">Zaloguj się</h3>
			<form method="POST" action="${contextPath}/logowanie" class="form-horizontal">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" /> <span>${message}</span>

				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon " id="login-addon">
							<span class="glyphicon glyphicon-user"></span>
						</span> 
						<input id="login-input" name="username" type="text" class="form-control" placeholder="login"
							aria-describedby="login-addon" />
					</div>
				</div>

				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon" id="password-addon">
							<span class="glyphicon glyphicon-lock"></span>
						</span> 
						<input id="password-input" name="password" type="password" class="form-control" placeholder="hasło"
							aria-describedby="password-addon" />
					</div>
				</div>
				
				<p class="error-alert text-center">${error}</p>

				<div class="form-group text-center">
					<button class="btn btn-primary btn-l" type="submit">Zaloguj się</button>
				</div>
				<div class="form-group text-center">
					<a href="${contextPath}/rejestracja">Utwórz konto</a>
				</div>
			</form>
		</div>
	</div>

	<script src="${contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>