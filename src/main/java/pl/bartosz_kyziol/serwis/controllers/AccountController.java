package pl.bartosz_kyziol.serwis.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.bartosz_kyziol.serwis.models.Car;
import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.models.Visit;
import pl.bartosz_kyziol.serwis.service.CarService;
import pl.bartosz_kyziol.serwis.service.UserService;
import pl.bartosz_kyziol.serwis.service.VisitService;

@Controller 
public class AccountController {

	@Autowired
	private VisitService visitService;

	@Autowired
	private CarService carService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/api/cars/{carId}/visits", method = RequestMethod.GET)
	@ResponseBody
	public List<Visit> findMyVisitsByCar(@PathVariable long carId) {
		Car car = carService.findById(carId);
		if (car.getOwner()==getCurrentUserId()){
			List<Visit> visits = visitService.findByCarId(carId);		
			return visits;
		} else {
			return null;
		}
	}
	
	
	@RequestMapping(value = "/api/visits", method = RequestMethod.POST)
	@ResponseBody
	public Visit postMyVisit(Visit visitForm) {

		visitService.save(visitForm);
		return visitForm;
	}
	
	
	@RequestMapping(value = "/api/visits/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void deleteMyVisit(@PathVariable long id) {
		
		Visit visitToDelete = visitService.findById(id);
		Car car = visitToDelete.getCar();
		if (car.getOwner() == getCurrentUserId()) {
			visitService.delete(visitToDelete);			
		}
		
	}
	
	@RequestMapping(value = "/api/cars", method = RequestMethod.GET)
	@ResponseBody
	public List<Car> findMyCars(Model model) {
	
		List<Car> cars = carService.findByOwner(getCurrentUserId());		
		
		return cars;
	}
	
	
	@RequestMapping(value = "/api/cars", method = RequestMethod.POST)
	@ResponseBody
	public Car postMyCar(Car carForm) {

		carForm.setOwner(getCurrentUserId());
		carService.save(carForm);

		return carForm;
	}
	
	
	@RequestMapping(value = "/api/cars/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void deleteMyCar(@PathVariable long id) {
		
		Car carToDelete = carService.findById(id);
		if (carToDelete.getOwner() == getCurrentUserId()) {
			carService.delete(carToDelete);			
		}
		
	}
	
	@RequestMapping(value = "/api/user", method = RequestMethod.POST)
	@ResponseBody
	public void changeUserData(
			@RequestParam(value="phone", required=false) String phone,
			@RequestParam(value="email", required=false) String email
			){
		
		User user = userService.findById(getCurrentUserId());

		if (phone != null){
			user.setPhone(phone);
			userService.save(user);
		}

		if (email != null){
			user.setEmail(email);
			userService.save(user);
		}

	}
	
	private long getCurrentUserId(){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User owner = userService.findByUsername(auth.getName());		
		long id = owner.getId();
		
		return id;
	}

}
