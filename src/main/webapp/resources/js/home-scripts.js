var scrollTimeout;


function scroll() {
  var windowTop = $(window).scrollTop();
  var windowBottom = $(window).scrollTop() + $(window).height();
  var terminalItemBottem = $('#divTimetable').height() + $('#divTimetable').offset().top + 70;
  var skillsTop = $('.skills-item').first().offset().top;

  if (terminalItemBottem  <  windowTop) {
    $('.timetable-small').animate({
      left: '0px',
    }, 200);
  }

  if (terminalItemBottem >=  windowTop)  {
    $('.timetable-small').animate({
      left: '-30px',
    }, 200);
    $('.timetable-item').animate({
      left: '0px',
    }, 300);
  }
}

function setTimeTablePosition() {
  var timetableMarginTop = (($(window).height() - $('#divTimetable').height()) / 3);
  $('#divTimetable').css({
    'margin-top': timetableMarginTop + 'px',
    'margin-bottom': (timetableMarginTop * 2) + 'px',
  });
  $('.timetable-container').css({ 'min-height': ($(window).height() - 50) + 'px' });
}

function setSkillItemsHight() {
  var highest = 0;
  var hight = 0;
  var skillsRowChildren = $('#skills-row').children();
  for (var i = 0; i < skillsRowChildren.length; i++) {
    $(skillsRowChildren[i]).children('.skills-item').css({ 'min-height': 'auto' });
    hight = $(skillsRowChildren[i]).height();
    if (hight > highest) {
    	highest = hight;
    }
  }

  highest = highest + 20;
  for (var j = 0; j < skillsRowChildren.length; j++) {
    $(skillsRowChildren[j]).children('.skills-item').css({ 'min-height': highest + 'px' });
  }
}

function scrollTo() {
  if (this.hash !== '') {
    event.preventDefault();
    var hash = this.hash;
    $('.skills-item').removeClass('frame');
    $('.contact-item').removeClass('frame');
    $('.aboutUs-item').removeClass('frame');
    $(hash).addClass('frame');
    $('html, body').animate({
      scrollTop: ($(hash).offset().top - 65)
    }, 800, function () {
      window.location.hash = hash;
    });
  }
}


function initMap() {
  var uluru = { lat: 51.109, lng: 17.032 };
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 15,
    center: uluru,
  });
  var marker = new google.maps.Marker({
    position: uluru,
    map: map,
  });
}

function setBlur() {
  $('.background-image').addClass('blur2px');
  $('.content').addClass('blur2px');
  $('.timetable-small').addClass('blur2px');
}

function removeBlur() {
  $('.background-image').removeClass('blur2px');
  $('.content').removeClass('blur2px');
  $('.timetable-small').removeClass('blur2px');
}

function highlight() {
  var which = $(this).attr('data-highlight');
  $('#' + which).removeClass('removeHighlight').addClass('highlight');
}

function removeHighlight() {
  var which = $(this).attr('data-highlight');
  $('#' + which).removeClass('highlight').addClass('removeHighlight');
}


$(window).scroll(function () {
  if (scrollTimeout) {
    clearTimeout(scrollTimeout);
    scrollTimeout = null;
  }

  scrollTimeout = setTimeout(scroll, 50);
});

$(window).resize(function () {
  setTimeTablePosition();
  setSkillItemsHight();
});

$(function () {
  setTimeTablePosition();
  setSkillItemsHight();

  $('.navbar').fadeTo(0, 0.4);

  setTimeout(function () {
    $('.timetable-item').animate({
      left: '0',
    }, 400);
    $('.navbar').fadeTo(400, 0.94);
  }, 600);

  $('#divTimetable').on('click', function () {
  });

  $('.timetable-small').on('click', function () {
  });

  $('.btn-skills').on('click', function () {
	setBlur();
    $('#modalSkills').modal({ 'backdrop': 'static' });
  });

  $('#modalSkills').on('hidden.bs.modal', removeBlur);

  $('.btn').mouseover(function () {
    highlight.call(this);
  });

  $('.btn').mouseout(function () {
	removeHighlight.call(this);
  });

  $('.btn').focus(function () {
	  highlight.call(this);
  });

  $('.btn-uslugi').blur(function () {
	  removeHighlight.call(this);
  });

  $('#mainNavbar a').click(function (event) {
    scrollTo.call(this);
  });

});