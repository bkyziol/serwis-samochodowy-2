$(function () {

	var $cars = $('#cars');
	var $carInputAlert = $('#car-input-alert')
	var $csrf = $('meta[name=csrf]');
	var $brand = $('#brand');
	var $model = $('#model');
	var $regNr = $('#registration_nr');
	var $accountAlert = $('#account-alert')
	var $datepicker = $('#datepicker')
	var numberOfCars =0;
	var daysTable = ['Niedziela', 'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota'];
	var monthsTable = ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec', 'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'];
	var selectedDate = new Date();


	getVisitsByDay();

	$.ajax({
		type : 'GET',
		url: '/api/cars',
		success: function(cars) {
			$.each(cars, function(i,car){
				addCarToList(car);
				getVisitsByCar(car);
				numberOfCars += 1;
			});
			checkNumberOfCars();		
		},
	});

	$('#add-car').on('click',function(){
		if ($brand.val().length > 0 && $model.val().length > 0 && $regNr.val().length > 0) {
			$.ajax({
				type: 'POST',
				url: 'api/cars',
				data:{
					brand: $brand.val(),
					model: $model.val(),
					registration_nr: $regNr.val(),
					_csrf: $csrf.attr('content')
				},
				success: function(newCar) {
					addCarToList(newCar);
					numberOfCars += 1;
					checkNumberOfCars();		
					$('#modalAddCar').modal('hide');
				},
				error: function(){
					alert('Nie udało się dodać pojazdu do bazy.');
				}
			});	
			$carInputAlert.addClass('hidden')
			$brand.val('');
			$model.val('');
			$regNr.val('');
		} else {
			$carInputAlert.removeClass('hidden')
		}
	});


	$cars.delegate('.removeCar','click', function() {	
		var $parentDiv = $(this).closest('div').parent('div');
		$.ajax({
			type: 'DELETE',
			url: 'api/cars/'+ $(this).attr('data-id'),
			headers:
			{
				'X-CSRF-Token': $csrf.attr('content')
			},
			success: function() {
				$parentDiv.remove();
				numberOfCars -= 1;
				checkNumberOfCars();
				getVisitsByDay();
			},
			error: function(){
				alert('Nie udało się usunąć pojazdu z bazy.');
			}
		});
	});



	$('#phone-button').on('click',function(){
		$('#phone-button').addClass('hidden');
		$('#phone-output').addClass('hidden');
		$('#phone-input').removeClass('hidden');
		$('#phone-save').removeClass('hidden');
		$('#phone-input').val($('#phone-output').text())	
	});


	$('#email-button').on('click',function(){
		$('#email-button').addClass('hidden');
		$('#email-output').addClass('hidden');
		$('#email-input').removeClass('hidden');
		$('#email-save').removeClass('hidden');
		$('#email-input').val($('#email-output').text())
	});

	$('#phone-save').on('click',function(){

		$('#phone-button').removeClass('hidden');
		$('#phone-output').removeClass('hidden');
		$('#phone-input').addClass('hidden');
		$('#phone-save').addClass('hidden');

		$.ajax({
			type: 'POST',
			url: 'api/user',
			data:{
				phone: $('#phone-input').val(),
				_csrf: $csrf.attr('content')
			},
			success: function() {
				$('#phone-output').text($('#phone-input').val());		
			},
			error: function(){
				alert('Nie udało się zmienić numeru telefonu w bazie.');
			}
		});	
	});


	$('#email-save').on('click',function(){

		$('#email-button').removeClass('hidden');
		$('#email-output').removeClass('hidden');
		$('#email-input').addClass('hidden');
		$('#email-save').addClass('hidden');

		$.ajax({
			type: 'POST',
			url: 'api/user',
			data:{
				email: $('#email-input').val(),
				_csrf: $csrf.attr('content')
			},
			success: function() {
				$('#email-output').text($('#email-input').val());		
			},
			error: function(){
				alert('Nie udało się zmienić adresu email w bazie.');
			}
		});	
	});


	$cars.delegate('.add-visit','click', function() {	
		var carId = $(this).attr('data-id');
		var date = selectedDate.getFullYear() + '-' + selectedDate.getMonth() + '-' + selectedDate.getDate();
		var time = $('.btn-dayPlan-selected').attr('date-time');
		if (time != null){
			$.ajax({
				type: 'POST',
				url: 'api/visits',
				data:{
					date: date,
					time: time,
					car: carId,
					_csrf: $csrf.attr('content')
				},
				success: function(newVisit) {
					$('.btn-dayPlan-selected').removeClass('btn-dayPlan-selected');
					$('#visits-'+ newVisit.car.id).append(addVisitToList(newVisit));
					getVisitsByDay();
				},
				error: function(){
					alert('Nie udało się dodać wizyty do bazy.');
				}
			});				
		}else {
			$accountAlert.removeClass('hidden');
			$('#account-alert-text').text(' Proszę wskazać datę i godzinę wizyty.');
		}
	});


	$cars.delegate('.remove-visit','click', function() {	
		var $closestDiv = $(this).closest('div');
		$.ajax({
			type: 'DELETE',
			url: 'api/visits/'+ $(this).attr('data-id'),
			headers:
			{
				'X-CSRF-Token': $csrf.attr('content')
			},
			success: function() {
				$closestDiv.remove();
				getVisitsByDay();
			},
			error: function(){
				alert('Nie udało się usunąć wizyty z bazy.');
			}
		});	
	});


	$.datepicker.regional['pl'] = {
			closeText: 'Zamknij',
			currentText: 'Dzisiaj',
			monthNames: monthsTable, 
			monthNamesShort: ['Sty', 'Lut', 'Mar', 'Kwi', 'Maj', 'Cze', 'Lip', 'Sie', 'Wrz', 'Paź', 'Lis', 'Gru'], 
			dayNames: daysTable,
			dayNamesShort: ['Nie', 'Pon', 'Wto', 'Śro', 'Czw', 'Pią', 'Sob'],
			dayNamesMin: ['Ni', 'Po', 'Wt', 'Śr', 'Cz', 'Pi', 'So'],
			dateFormat: 'dd/mm/yy',
	};

	$.datepicker.setDefaults($.datepicker.regional['pl']);

	$datepicker.datepicker({
		minDate: 0,
		firstDay: 1,
		onSelect: function () {
			selectedDate = $(this).datepicker('getDate');
			$('.btn-dayPlan-selected').removeClass('btn-dayPlan-selected');
			$('.btn-dayPlan-reserved').removeClass('btn-dayPlan-reserved');
			getVisitsByDay();
		},
	});

	$('.btn-dayPlan').on('click', function () {
		if ($(this).hasClass('btn-dayPlan-disabled') === false) {
			$('.btn-dayPlan').removeClass('btn-dayPlan-selected');
			$(this).addClass('btn-dayPlan-selected');
			$accountAlert.addClass('hidden');
			checkNumberOfCars();
		}
	});

	$('#open-add-car').on('click', function () {
		setBlur();
		$carInputAlert.addClass('hidden')
		$('#modalAddCar').modal({ 'backdrop': 'static' });
	});

	$('#modalAddCar').on('hidden.bs.modal', removeBlur);


	function getVisitsByDay() {
		var request = '?day=' + selectedDate.getDate() + '&month=' + selectedDate.getMonth() + '&year=' + selectedDate.getFullYear();
		$('#dayOfWeek').html(daysTable[selectedDate.getDay()]);
		$.ajax({
			type: 'GET',
			url: 'api/visits' + request,
			success: function (visits) {
				$('.btn-dayPlan-disabled').html('Wolne');
				$('.btn-dayPlan-disabled').removeClass('btn-dayPlan-disabled');
				$.each(visits, function (i, visit) {
					$('#btn-' + visit.time).addClass('btn-dayPlan-disabled');
					$('#btn-' + visit.time).html('Zajęte');
				});
			},
			error: function () {
				alert('Brak połączenia z serwerem.');
			},
		});
	}


	function checkNumberOfCars(){
		if (numberOfCars == 0){
			$accountAlert.removeClass('hidden');
			$('#account-alert-text').text(' Brak zapisanych pojazdów, dodaj pojazd do bazy.');
		} else {
			$accountAlert.addClass('hidden');
		}
	}


	function getVisitsByCar(car){
		$.ajax({
			type : 'GET',
			url: '/api/cars/'+car.id+'/visits',
			success: function(visits) {
				$.each(visits, function(i,visit){
					$('#visits-'+ visit.car.id).append(addVisitToList(visit));
				});
			},
			error: function(){
				alert('Błąd w trakcie pobierania listy wizyt z serwera.');
			}
		});		
	};


	function addVisitToList(visit){
		var time = visit.time.slice(0,2) + ":" + visit.time.slice(2);
		var date = visit.date.split('-');
		var dateString = date[2]+' '+monthsTable[date[1]] +' '+date[0];

		var visitHtml = (
				"<div class='visit-div'>Data: " + dateString +  "<tab2em/> Godzina: " + time + 
				"<button type='button' class='btn btn-xs btn-default pull-right remove-visit' data-id='"+ visit.id +"'>" +
				"<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Odwołaj" +
				"</button><div class='clearfix'></div></div>"
		); 
		return visitHtml;
	}


	function addCarToList(car){
		$cars.append(
				"<div><div class='car-div'>"+ car.brand +" "+ car.model +"<tab4em/> nr rej.: "+ car.registration_nr +
				"<button type='button' class='btn btn-default pull-right removeCar' data-id='"+ car.id +"'>" +
				"<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>" +
				"</button><div class='clearfix'></div></div><div class='visits-list-div'>" +
				"<div id='visits-"+ car.id +"'></div><div class='text-center'>" +
				"<button class='btn btn-default add-visit' data-id='"+car.id +"'>" +
				"<span class='glyphicon glyphicon-plus'></span> Dodaj wizytę</div></div></div>"
				);		
	}
	
	function setBlur() {
		$('.background-image').addClass('blur2px');
		$('.content').addClass('blur2px');
	}

	function removeBlur() {
		$('.background-image').removeClass('blur2px');
		$('.content').removeClass('blur2px');
	}

});





