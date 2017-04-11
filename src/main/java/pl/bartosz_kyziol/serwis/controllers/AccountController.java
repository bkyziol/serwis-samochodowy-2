package pl.bartosz_kyziol.serwis.controllers;

import java.security.cert.CertSelector;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.bartosz_kyziol.serwis.models.Car;
import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.repository.CarsRepository;
import pl.bartosz_kyziol.serwis.service.CarService;
import pl.bartosz_kyziol.serwis.service.UserService;

@Controller 
public class AccountController {

	@Autowired
	private CarService carService;
	
	@Autowired
	private UserService userService;

	
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
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout() {
	
	}
	
	private long getCurrentUserId(){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User owner = userService.findByUsername(auth.getName());		
		long id = owner.getId();
		
		return id;
	}

}
