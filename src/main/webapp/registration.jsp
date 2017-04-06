<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Serwis samochodowy</title>
</head>
<head>
<meta name="description" content="Serwis samochodowy">
<meta name="author" content="Bartosz Kyzioł">

<title>Witaj</title>
</head>

<body>

	<div>

		<form:form method="POST" modelAttribute="userForm">
			<h2 class="form-signin-heading">Create your account</h2>
			<spring:bind path="login">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="login" class="form-control"
						placeholder="Login" autofocus="true"></form:input>
					<form:errors path="login"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="password">
				<div class="form-group ${status.error ? 'has-error' : ''}">	
					<form:input type="password" path="password" placeholder="Hasło"></form:input>
					<form:errors path="password"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="email">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="email"
						class="form-control" placeholder="Adres e-mail"></form:input>
					<form:errors path="email"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="phone">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="phone"
						class="form-control" placeholder="Numer telefonu"></form:input>
					<form:errors path="phone"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Zatwierdź</button>
		</form:form>

	</div>

</body>
</html>