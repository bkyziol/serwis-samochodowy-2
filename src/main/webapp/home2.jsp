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

<title>Serwis samochodowy</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Bangers|Nothing+You+Could+Do|Noto+Sans|Rationale" rel="stylesheet">
<link href="${contextPath}/resources//css/fontello.css" rel="stylesheet"/>
<link href="${contextPath}/resources/css/jquery-ui.css" rel="stylesheet"/>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet"/>
<link href="${contextPath}/resources/css/registration.css" rel="stylesheet">


</head>

<body id="divHome" data-spy="scroll" data-target="#mainNavbar" data-offset="100">

  <div class="background-image"></div>
  <div class="content">
   <!--O NAS-->
    <div class="container-fluid aboutUs-container">
      <div class="container">
        <div id="divONas" class="row aboutUs-item">
          <div class="col-sm-6 col-md-7">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
              </ol>
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="resources/img/pracownicy.jpg" alt="O nas" height="496" width="750"/>
                </div>
                <div class="item">
                  <img src="resources/img/pracownicy2.jpg" alt="O nas" height="496" width="750"/>
                </div>
                <div class="item">
                  <img src="resources/img/pracownicy3.jpg" alt="O nas" height="496" width="750"/>
                </div>
              </div>
              <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"  aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
          </div>
          <div class="col-sm-6 col-md-5">
            <div>
              <h3>Kim jesteśmy:</h3>
              <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque accumsan est vehicula ex hendrerit feugiat quis vel libero. Ut orci nisl, congue ut ex blandit, interdum malesuada nulla. Vivamus non metus id dui varius porta ut ut leo. Donec laoreet libero dolor, id fermentum erat aliquet sed. Aliquam bibendum euismod magna ac lacinia. Nunc vel lobortis nulla, tincidunt finibus sem. Sed mattis augue sed luctus porta. In malesuada condimentum semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras posuere justo urna, a maximus leo gravida eget. Curabitur in massa neque. Sed nibh orci, dignissim ut mi sed, convallis semper enim. Sed consequat vel odio eu lacinia.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--STOPKA-->
  </div>
  <script src="${contextPath}/resources/js/jquery-3.2.0.min.js"></script>
  <script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${contextPath}/resources/js/home-scripts.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk8BsxjXEYPrCBhCY3HqrMSn6J77-1JKA&callback=initMap"></script>
  

</body>
</html>