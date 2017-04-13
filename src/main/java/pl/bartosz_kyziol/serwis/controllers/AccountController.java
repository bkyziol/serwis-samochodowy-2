package pl.bartosz_kyziol.serwis.controllers;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
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
	public List<Visit> findVisitsByCarId(@PathVariable long carId) {
		
		if (carService.findById(carId).getOwner() == getLoggedUserId()) {
			List <Visit> visits = visitService.findByCarId(carId);
			return visits;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/api/visits", method = RequestMethod.GET)
	@ResponseBody
	public List<Visit> getVisitsByDay(@RequestParam int day, int month, int year) {
		
		String date = year+"-"+month+"-"+day;
		List<Visit>visits = visitService.findByDate(date);
		
		return visits;
	}
	
	@RequestMapping(value = "/api/visits", method = RequestMethod.POST)
	@ResponseBody
	public Visit postMyVisit(Visit visitForm) {

		if (visitForm.getCar().getOwner() == getLoggedUserId()) {
			visitService.save(visitForm);
			return visitForm;
		} else {
			return null;
		}
	}
	
	
	@RequestMapping(value = "/api/visits/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void deleteMyVisit(@PathVariable long id) {
		
		Visit visitToDelete = visitService.findById(id);
		if (visitToDelete.getCar().getOwner() == getLoggedUserId()) {
			visitService.delete(visitToDelete);			
		}
		
	}
	
	@RequestMapping(value = "/api/cars", method = RequestMethod.GET)
	@ResponseBody
	public List<Car> findMyCars() {
	
		List<Car> cars = carService.findByOwner(getLoggedUserId());		
		
		return cars;
	}
	
	
	@RequestMapping(value = "/api/cars", method = RequestMethod.POST)
	@ResponseBody
	public Car postMyCar(Car carForm) {

		carForm.setOwner(getLoggedUserId());
		carService.save(carForm);

		return carForm;
	}
	
	
	@RequestMapping(value = "/api/cars/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public void deleteMyCar(@PathVariable long id) {
		
		Car carToDelete = carService.findById(id);
		if (carToDelete.getOwner() == getLoggedUserId()) {
			List <Visit> visitsToDelete = visitService.findByCarId(id);
			for (Visit visit : visitsToDelete) {
				visitService.delete(visit);
				
			}
			carService.delete(carToDelete);			
		}
		
	}
	
	@RequestMapping(value = "/api/user", method = RequestMethod.POST)
	@ResponseBody
	public void changeUserData(
			@RequestParam(value="phone", required=false) String phone,
			@RequestParam(value="email", required=false) String email
			){
		
		User user = userService.findById(getLoggedUserId());

		if (phone != null){
			user.setPhone(phone);
			userService.save(user);
		}

		if (email != null){
			user.setEmail(email);
			userService.save(user);
		}

	}
	
	private long getLoggedUserId(){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User loggedUser = userService.findByUsername(auth.getName());		
		long id = loggedUser.getId();
		
		return id;
	}

}
