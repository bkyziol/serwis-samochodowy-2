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


</head>

<body id="divHome" data-spy="scroll" data-target="#mainNavbar" data-offset="100">

  <div class="background-image"></div>
  <div class="content">
    <!--NAWIGACJA-->
    <nav id="mainNavbar" class="nav navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navHeaderCollapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="navbar-brand">NAZWAFIRMY</span>
        </div>
        <div class="collapse navbar-collapse" id="navHeaderCollapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="#divHome"><span class="glyphicon glyphicon-home"></span> Strona główna<span class="sr-only">(current)</span></a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Mechanika <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#divZawieszenie">Zawieszenie</a></li>
                <li><a href="#divHamulce">Hamulce</a></li>
                <li><a href="#divGeometria">Geometria</a></li>
                <li><a href="#divKlimatyzacja">Klimatyzacja</a></li>
                <li><a href="#divPrzeglady">Przeglądy</a></li>
                <li><a href="#divAutodetailing">Autodetailing</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Obsługa kół <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#divOpony">Wymiana opon</a></li>
                <li><a href="#divWulkanizacja">Wulkanizacja</a></li>
                <li><a href="#divProstowanie">Naprawa felg</a></li>
                <li><a href="#divPrzechowalnia">Przechowalnia kół</a></li>
                <li><a href="#divFelgi">Sprzedaż felg</a></li>
                <li><a href="#divSprzedaz">Sprzedaż opon</a></li>
              </ul>
            </li>
            <li><a href="#divKontakt"><span class="glyphicon glyphicon-earphone"></span> Kontakt<span class="sr-only">(current)</span></a></li>
            <li><a href="#divONas"><span class="glyphicon glyphicon-info-sign"></span> O nas<span class="sr-only">(current)</span></a></li>
          </ul>
        </div>
      </div>
    </nav>
    <!--TERMINARZ-->
    <div class="container-fluid timetable-container" >
      <div id="divTimetable" class="col-lg-offset-1 col-sm-offset-1 col-sm-6 col-lg-4 timetable-item">
        <h3 class="text-center">Umów się na wymianę&nbsp;opon:</h3>
        <p class="text-center"><span class="btn btn-timetable" data-highlight="divTerminarz">Terminarz</span></p>
      </div>
    </div>
    <!--USŁUGI-->
    <div class="container-fluid skills-container">
      <div class="container">
        <div class="row" id="skills-row">
          <div class="col-sm-6 col-md-4">
            <div id="divZawieszenie" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/zawieszenie.jpg" alt="Zawieszenie" height="265" width="400" />
              <h2 class="text-center">Zawieszenie</h2>
              <p class="text-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras massa sapien, pharetra ultrices posuere et, cursus vel velit. Aliquam erat volutpat. Phasellus ac odio quis quam ultrices suscipit quis vitae nibh.</p>
              <button class="btn btn-skills" data-highlight="divZawieszenie">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divHamulce" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/hamulce.jpg" alt="Hamulce" height="265" width="400" />
              <h2 class="text-center">Hamulce</h2>
              <p class="text-justify">Praesent fringilla ac velit vitae vehicula. Sed sed dapibus purus, at volutpat lorem. Donec finibus vulputate nisl, sagittis aliquam leo tristique non.</p>
              <button class="btn btn-skills" data-highlight="divHamulce">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
              <div id="divGeometria" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/geometria.jpg" alt="Geometria" height="265" width="400" />
              <h2 class="text-center">Geometria</h2>
              <p class="text-justify">Morbi facilisis arcu libero, auctor varius enim sollicitudin eget. Phasellus mollis molestie odio quis aliquet. Nunc non accumsan nibh. </p>
              <button class="btn btn-skills" data-highlight="divGeometria">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divKlimatyzacja" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/klimatyzacja.jpg" alt="Klimatyzacja" height="265" width="400" />
              <h2 class="text-center">Klimatyzacja</h2>
              <p class="text-justify">Pellentesque suscipit auctor metus eu egestas. Integer congue ultrices ipsum sit amet ullamcorper. Suspendisse vulputate pretium quam vel elementum.</p>
              <button class="btn btn-skills" data-highlight="divKlimatyzacja">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divPrzeglady" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/przeglad.jpg" alt="Przeglad" height="265" width="400" />
              <h2 class="text-center">Przeglądy</h2>
              <p class="text-justify">Praesent molestie varius nunc, ornare tempor urna sollicitudin nec. Suspendisse nec sapien non nunc pharetra maximus vitae sit amet enim.</p>
              <button class="btn btn-skills" data-highlight="divPrzeglady">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divAutodetailing" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/autodetailing.jpg" alt="Autodetailing" height="265" width="400" />
              <h2 class="text-center">Autodetailing</h2>
              <p class="text-justify">Cras lacinia orci sodales ipsum blandit facilisis. Praesent accumsan aliquam lorem sed venenatis. Sed eget metus interdum, laoreet lectus quis, mattis nibh.</p>
              <button class="btn btn-skills" data-highlight="divAutodetailing">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divOpony" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/opony.jpg" alt="Wymiana opon" height="265" width="400" />
              <h2 class="text-center">Wymiana opon</h2>
              <p class="text-justify">Sed aliquet velit massa, nec egestas odio hendrerit id. Integer in nisl at lorem luctus sagittis sed vel turpis. Etiam porttitor, est a egestas imperdiet, enim tortor tempus est, ut pulvinar felis justo eu tortor.</p>
              <button class="btn btn-skills" data-highlight="divOpony">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divWulkanizacja" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/wulkanizacja.jpg" alt="Wulkanizacja" height="265" width="400" />
              <h2 class="text-center">Naprawa opon</h2>
              <p class="text-justify">Nam accumsan rutrum arcu sollicitudin malesuada. Phasellus vestibulum at sem in feugiat. </p>
              <button class="btn btn-skills" data-highlight="divWulkanizacja">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divProstowanie" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/prostowanie.jpg" alt="Prostowanie" height="265" width="400" />
              <h2 class="text-center">Naprawa felg</h2>
              <p class="text-justify">Nam consectetur tortor magna, eget mattis erat dictum ut. Pellentesque feugiat sem non arcu euismod, vel fermentum leo congue.</p>
              <button class="btn btn-skills" data-highlight="divProstowanie">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divPrzechowalnia" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/przechowalnia.jpg" alt="przechowalnia" height="265" width="400">
              <h2 class="text-center">Przechowalnia kół</h2>
              <p class="text-justify">Pellentesque suscipit auctor metus eu egestas. Integer congue ultrices ipsum sit amet ullamcorper. Suspendisse vulputate pretium quam vel elementum.</p>
              <button class="btn btn-skills" data-highlight="divPrzechowalnia">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divFelgi" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/felgi.jpg" alt="felgi" height="265" width="400">
              <h2 class="text-center">Sprzedaż felg</h2>
              <p class="text-justify">Praesent molestie varius nunc, ornare tempor urna sollicitudin nec. Suspendisse nec sapien non nunc pharetra maximus vitae sit amet enim.</p>
              <button class="btn btn-skills" data-highlight="divFelgi">Więcej</button>
            </div>
          </div>
          <div class="col-sm-6 col-md-4">
            <div id="divSprzedaz" class="skills-item">
              <img class="center-block img-responsive" src="/resources/img/sprzedaz.jpg" alt="sprzedaz" height="265" width="400">
              <h2 class="text-center">Sprzedaż opon</h2>
              <p class="text-justify">Sed aliquet velit massa, nec egestas odio hendrerit id. Integer in nisl at lorem luctus sagittis sed vel turpis. Etiam porttitor, est a egestas imperdiet, enim tortor tempus est, ut pulvinar felis justo eu tortor.</p>
              <button class="btn btn-skills" data-highlight="divSprzedaz">Więcej</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--KONTAKT-->
    <div class="container-fluid contact-container">
      <div class="container">
        <div id="divKontakt" class="row contact-itme">
          <div class="col-sm-6">
            <div>
              <p><span class="glyphicon glyphicon-map-marker"></span> 53-144 Wrocław ul. Zmyślona 13/3</p>
              <p>
                <table>
                  <tr><th><span class="glyphicon glyphicon glyphicon-time"></span>
                  </th><th>&nbsp;Pon. - Pt.:&nbsp;&nbsp;&nbsp;</th><th>9:00 - 17:00</th></tr>
                  <tr><th></th><th>&nbsp;Sob.:</th><th>9:00 - 13:00</th></tr>
                </table>
              </p>
            </div>
          </div>
          <div class="col-sm-6">
            <div>
              <p><span class="glyphicon glyphicon-earphone"></span> 71 123 45 67</p>
              <p><span class="glyphicon glyphicon-phone"></span> 987 654 321</p>
              <p><span class="glyphicon glyphicon-envelope"></span> info@nazwafirmy.pl</p>
            </div>
          </div>
          <div class="col-sm-12 col-md-12">
            <div id="map"></div>
          </div>
        </div>
      </div>
    </div>
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
                  <img src="/resources/img/pracownicy.jpg" alt="O nas" height="496" width="750"/>
                </div>
                <div class="item">
                  <img src="/resources/img/pracownicy2.jpg" alt="O nas" height="496" width="750"/>
                </div>
                <div class="item">
                  <img src="/resources/img/pracownicy3.jpg" alt="O nas" height="496" width="750"/>
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
    <div class="navbar navbar-inverse navbar-fixed-bottom">
      <div class="container-fluid ">
        <div class="author pull-right">Autor strony: <span class="author-signature">Bartosz Kyziol</span></div>
      </div>
    </div>
  </div>
    <!-- MODAL USŁUGI -->
  <div class="modal fade" id="modalSkills" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content" id="divModal">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Lorem ipsum</h3>
        </div>
        <div class="modal-body">
          <img class="center-block img-responsive" src="/resources/img/narzedzia.jpg" alt="Narzedzia" height="468" width="900" />
          <p><br/>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non convallis tortor. Fusce vitae magna volutpat, sagittis urna non, fermentum velit. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras at efficitur lectus. Fusce vel sem eu tortor porttitor facilisis. Fusce posuere odio lectus, et ornare nunc mattis non. Nulla pretium erat nec efficitur tempor. Nunc consequat nibh sit amet vulputate pharetra. Integer id auctor eros. Phasellus non orci eget urna pulvinar cursus. Nulla facilisi. In hac habitasse platea dictumst. Etiam pellentesque, tellus in faucibus porta, enim sem elementum nisi, quis laoreet nunc erat a turpis.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-modal" data-dismiss="modal" name="button">Zamknij</button>
        </div>
      </div>
    </div>
  </div>

  <div class="timetable-small">Terminarz&nbsp;&nbsp;<span class="glyphicon glyphicon-calendar rotation"></span></div>
  
  <script src="${contextPath}/resources/js/jquery-3.2.0.min.js"></script>
  <script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${contextPath}/resources/js/home-scripts.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk8BsxjXEYPrCBhCY3HqrMSn6J77-1JKA&callback=initMap"></script>
  

</body>
</html>