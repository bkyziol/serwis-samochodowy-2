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

<title>Rejestracja</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/main.css" rel="stylesheet"/>
<link href="${contextPath}/resources/css/registration.css" rel="stylesheet">

</head>

<body>

 	<div class="background-image"></div>
	<div class="content">

		<div id="registration-div" class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
			<a href="/terminarz" class="btn btn-default btn-sm pull-right"><span class="glyphicon glyphicon-remove"></span></a>
			<h2 class="form-signin-heading">Rejestracja:</h2><br />

			<form:form id="registration-form" method="POST" modelAttribute="userForm" action="${contextPath}/rejestracja"
				class="form-horizontal">

				<spring:bind path="login">
					<div class="form-group ">
						<label for="inputLogin" class="col-sm-2 control-label">Login:</label>
						<div class="col-sm-10 ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="login" class="form-control "
								placeholder="login" autofocus="true" id="inputLogin"></form:input>
							<form:errors class="error-alert" path="login"></form:errors>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="password">
					<div class="form-group ">
						<label for="inputPassword" class="col-sm-2 control-label">Hasło:</label>
						<div class="col-sm-10 ${status.error ? 'has-error' : ''}">
							<form:input type="password" path="password" class="form-control"
								placeholder="hasło" id="inputPassword"></form:input>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="passwordConfirm">
					<div class="form-group">
						<label for="inputConfirm" class="col-sm-2 control-label"></label>
						<div class="col-sm-10 ${status.error ? 'has-error' : ''}">
							<form:input type="password" path="passwordConfirm"
								class="form-control" placeholder="powtórz hasło"
								id="inputConfirm"></form:input>
							<form:errors class="error-alert" path="password"></form:errors>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="email">
					<div class="form-group">
						<label for="inputEmail" class="col-sm-2 control-label">Email:</label>
						<div class="col-sm-10 ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="email" class="form-control"
								placeholder="adres e-mail" id="inputEmail"></form:input>
							<form:errors class="error-alert" path="email"></form:errors>
						</div>
					</div>
				</spring:bind>

				<spring:bind path="phone">
					<div class="form-group">
						<label for="inputPhone" class="col-sm-2 control-label">Telefon:</label>
						<div class="col-sm-10 ${status.error ? 'has-error' : ''}">
							<form:input type="text" path="phone" class="form-control"
								placeholder="numer telefonu" id="inputPhone"></form:input>
							<form:errors class="error-alert" path="phone"></form:errors>
						</div>
					</div>
				</spring:bind>

				<div class="form-group">
					<div class="text-center">
						<br/><button class="btn btn-primary btn-lg" type="submit">Zatwierdź</button>
					</div>
				</div>

			</form:form>

		</div>
	</div>

	<script src="${contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>