<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/jquery-ui.css" rel="stylesheet">
<link href="${contextPath}/resources/css/account.css" rel="stylesheet">
<link href="${contextPath}/resources/css/main.css" rel="stylesheet">

</head>

<body>
	<div class="content">
		<div class="container-fluid">
			<div class="container">
				<div class="row">
					<div class="col-xs-6 text-left">
						<h3><span class="glyphicon glyphicon-user"></span> ${user.login}</h3>
					</div>
					<div class="col-xs-6 text-right">
						<a id="logout-button" href="/logout" class="btn btn-default">Wyloguj <span class="glyphicon glyphicon-off"></span></a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5">
						<p><b>DANE KONTAKTOWE:</b></p>
						<table id="contact-data">
							<tr>
								<td>Telefon:</td>
								<td>
									<span id="phone-output">${user.phone}</span>
									<input id="phone-input" class="hidden"></input>
								</td>
								<td>
									<button id="phone-button" class="btn btn-default btn-xs">
									<small><span class="glyphicon glyphicon-pencil"></span> Edytuj</small></button>
									<button id="phone-save" class="btn btn-default btn-xs hidden"><small>
									<span class="glyphicon glyphicon-pencil"></span> Zapisz</small></button>						
								</td>
							</tr>
							<tr>
								<td>Adres e-mail:</td>
								<td>
									<span id="email-output">${user.email}</span>
									<input id="email-input" class="hidden"></input>
								</td>
									<td><button id="email-button" class="btn btn-default btn-xs">
									<small><span class="glyphicon glyphicon-pencil"></span> Edytuj</button></small>
									<button id="email-save" class="btn btn-default btn-xs hidden"><small>
									<span class="glyphicon glyphicon-pencil"></span> Zapisz</button></small>						
								</td>
							</tr>
						</table>
						<br/>
						<p><b>TWOJE POJAZDY:</b></p>
						<div id="no-cars" class='car-div-alert'>
							<span class="glyphicon glyphicon-exclamation-sign"></span> Brak pojazdów w bazie.
						</div>
						<div id="cars"></div>
			
						<div class="text-center">
							<button id="open-add-car" class="btn btn-primary"><span class="glyphicon glyphicon-plus">
							</span> Dodaj pojazd</button>
						</div>
						
						<div id="add-car-form" class="form-horizontal hidden carDiv">
			
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
							<div class="text-center">
								<p id="car-input-alert" class="hidden" >Proszę uzupełnić wszystkie pola.</p>
							</div>
							<div class="text-center col-sm-6">
								<div class="form-group">
									<button id="add-car" class="btn btn-primary" type="submit">
									<span class="glyphicon glyphicon-floppy-disk"></span> Zapisz pojazd</button>
								</div>
							</div>
							<div class="text-center col-sm-6">
								<div class="form-group">
									<button id="close-add-car" class="btn btn-primary" type="submit">
									<span class="glyphicon glyphicon-remove"></span> Zamknij</button>
								</div>				
							</div>
						</div>
					</div>
					<div class="col-md-7">
						<div class="row">
							<div class="col-sm-6 center-block">
								<div type="text" id="datepicker"></div>
							</div>
							<div class="col-sm-6 center-block">
								<div class="dayPlan">
									<div class="dayPlan-header">
										<span id="dayOfWeek">Poniedziałek</span>
									</div>
									<div class="dayPlan-content">
										<table id="dayPlan-table">
											<tr>
												<th>09:00</th><th><span id="btn-0900" class="btn-dayPlan" date-time="0900">Wolne</span></th>
												<th>13:30</th><th><span id="btn-1330" class="btn-dayPlan" date-time="1330">Wolne</span></th>
											</tr>
											<tr>
												<th>09:30</th><th><span id="btn-0930" class="btn-dayPlan" date-time="0930">Wolne</span></th>
												<th>14:00</th><th><span id="btn-1400" class="btn-dayPlan" date-time="1400">Wolne</span></th>
											</tr>
											<tr>
												<th>10:00</th><th><span id="btn-1000" class="btn-dayPlan" date-time="1000">Wolne</span></th>
												<th>14:30</th><th><span id="btn-1430" class="btn-dayPlan" date-time="1430">Wolne</span></th>
											</tr>
											<tr>
												<th>10:30</th><th><span id="btn-1030" class="btn-dayPlan" date-time="1030">Wolne</span></th>
												<th>15:00</th><th><span id="btn-1500" class="btn-dayPlan" date-time="1500">Wolne</span></th>
											</tr>
											<tr>
												<th>11:00</th><th><span id="btn-1100" class="btn-dayPlan" date-time="1100">Wolne</span></th>
												<th>15:30</th><th><span id="btn-1530" class="btn-dayPlan" date-time="1530">Wolne</span></th>
											</tr>
											<tr>
												<th>11:30</th><th><span id="btn-1130" class="btn-dayPlan" date-time="1130">Wolne</span></th>
												<th>16:00</th><th><span id="btn-1600" class="btn-dayPlan" date-time="1600">Wolne</span></th>
											</tr>
											<tr>
												<th>12:00</th><th><span id="btn-1200" class="btn-dayPlan" date-time="1200">Wolne</span></th>
												<th>16:30</th><th><span id="btn-1630" class="btn-dayPlan" date-time="1630">Wolne</span></th>
											</tr>
											<tr>
												<th>12:30</th><th><span id="btn-1230" class="btn-dayPlan" date-time="1230">Wolne</span></th>
												<th>17:00</th><th><span id="btn-1700" class="btn-dayPlan" date-time="1700">Wolne</span></th>
											</tr>
											<tr>
												<th>13:00</th><th><span id="btn-1300" class="btn-dayPlan" date-time="1300">Wolne</span></th>
												<th>17:30</th><th><span id="btn-1730" class="btn-dayPlan" date-time="1730">Wolne</span></th>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<script src="${contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	<script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/account-scripts.js"></script>



</body>
</html>