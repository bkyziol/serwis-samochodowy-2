$(function () {
	
	
	var $cars = $('#cars');
	var $csrf = $('meta[name=csrf]');
	var $brand = $('#brand');
	var $model = $('#model');
	var $reg_nr = $('#registration_nr');
	var $noCars = $('#no-cars')
	var $numberOfCars =0;

	
	$.ajax({
		type : 'GET',
		url: '/api/cars',
		success: function(cars) {
			$.each(cars, function(i,car){
				addCarToList(car);
				$numberOfCars += 1;
			});
			checkNumberOfCars();		
		},
	});

	
	$('#add-car').on('click',function(){
		if ($brand.val().length > 0 && $model.val().length > 0 && $reg_nr.val().length > 0) {
			$.ajax({
				type: 'POST',
				url: 'api/cars',
				data:{
					brand: $brand.val(),
					model: $model.val(),
					registration_nr: $reg_nr.val(),
					_csrf: $csrf.attr('content')
				},
				success: function(newCar) {
					addCarToList(newCar);
					$numberOfCars += 1;
					checkNumberOfCars();		
				},
				error: function(){
					alert('Nie udało się dodać pojazdu do bazy.');
				}
			});	
			$('#car-input-alert').addClass('hidden')
			$brand.val('');
			$model.val('');
			$reg_nr.val('');
		} else {
			$('#car-input-alert').removeClass('hidden')
		}
	});
	
	
	$cars.delegate('.removeCar','click', function() {	
		var $closestDiv = $(this).closest('div');
		$.ajax({
			type: 'DELETE',
			url: 'api/cars/'+ $(this).attr('data-id'),
		    headers:
		    {
		        'X-CSRF-Token': $csrf.attr('content')
		    },
			success: function() {
				$closestDiv.remove();
				$numberOfCars -= 1;
				checkNumberOfCars();		
			},
			error: function(){
				alert('Nie udało się usunąć pojazdu do bazy.');
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
	
	
	function addCarToList(car){
		$cars.append(
				"<div class='car-div'>"+ car.brand +" "+ car.model +" nr rej.:"+ car.registration_nr +
				"<button type='button' class='btn btn-default pull-right removeCar' data-id="+ car.id +">" +
				"<span class='glyphicon glyphicon-trash' aria-hidden='true'></span>" +
				"</button></div>");		
	}
	
	function checkNumberOfCars(){
		if ($numberOfCars == 0){
			$noCars.removeClass('hidden');
		} else {
			$noCars.addClass('hidden');
		}
	}
	
});





