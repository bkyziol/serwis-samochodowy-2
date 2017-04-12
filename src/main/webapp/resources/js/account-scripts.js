$(function () {

	var $addCar = $('#add-car');
	var $cars = $('#cars');
	var $carInputAlert = $('#car-input-alert')
	var $csrf = $('meta[name=csrf]');
	var $brand = $('#brand');
	var $model = $('#model');
	var $regNr = $('#registration_nr');
	var $noCars = $('#no-cars')
	var numberOfCars =0;

	
	$addCar.on('click',function(){
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
			},
			error: function(){
				alert('Nie udało się usunąć pojazdu z bazy.');
			}
		});
	});

	
	$('#open-add-car').on('click',function(){
		$('#add-car-form').removeClass('hidden');
		$('#open-add-car').addClass('hidden');
	});

	
	$('#close-add-car').on('click',function(){
		$('#open-add-car').removeClass('hidden');
		$('#add-car-form').addClass('hidden');		
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
		var $carId = $(this).attr('data-id');
		console.log()
		$.ajax({
			type: 'POST',
			url: 'api/visits',
			data:{
				car: $carId,
				_csrf: $csrf.attr('content')
			},
			success: function(newVisit) {
				$('#visits-'+ newVisit.car.id).append(addVisitToList(newVisit));
			},
			error: function(){
				alert('Nie udało się dodać wizyty do bazy.');
			}
		});	
	});

	
	$cars.delegate('.remove-visit','click', function() {	
		var $closestDiv = $(this).closest('div');
		console.log()
		$.ajax({
			type: 'DELETE',
			url: 'api/visits/'+ $(this).attr('data-id'),
		    headers:
		    {
		        'X-CSRF-Token': $csrf.attr('content')
		    },
			success: function() {
				$closestDiv.remove();
			},
			error: function(){
				alert('Nie udało się usunąć wizyty z bazy.');
			}
		});	
	});

	
	function checkNumberOfCars(){
		if (numberOfCars == 0){
			$noCars.removeClass('hidden');
		} else {
			$noCars.addClass('hidden');
		}
	}

//---------------------------------------------------------------------------------------------------------------

	
	

	
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
		var visit = (
				"<div class='visit-div'>Data: Godzina:" +
				"<button type='button' class='btn btn-xs btn-default pull-right remove-visit' data-id='"+ visit.id +"'>" +
				"<span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Odwołaj" +
				"</button></div>"
		); 
		return visit;
	}
	
	
	function addCarToList(car){
		$cars.append(
				"<div><div class='car-div'>"+ car.brand +" "+ car.model +"<tab1/> nr rej.: "+ car.registration_nr +
				"<button type='button' class='btn btn-default pull-right removeCar' data-id='"+ car.id +"'>" +
				"<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>" +
				"</button></div><div class='visits-list-div'>" +
				"<div id='visits-"+ car.id +"'></div><div class='text-center'>" +
				"<button class='btn btn-default btn-sm add-visit' data-id='"+car.id +"'>" +
				"<span class='glyphicon glyphicon-plus'></span> Dodaj wizytę</div></div></div>");		
	}
	
});





