package pl.bartosz_kyziol.serwis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.bartosz_kyziol.serwis.models.Car;
import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.service.UserService;
import pl.bartosz_kyziol.serwis.validator.UserValidator;

@Controller 
public class UserController {

	@Autowired
    private UserService userService;

	@Autowired
	private UserValidator userValidator;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/rejestracja", method = RequestMethod.GET)
	public String registration(Model model) {
		model.addAttribute("userForm", new User());
		return "registration";
	}

	@RequestMapping(value = "/rejestracja", method = RequestMethod.POST)
	public String registration(@ModelAttribute("userForm") User userForm, Model model, BindingResult bindingResult) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		} else {
	        userForm.setPassword(new BCryptPasswordEncoder().encode(userForm.getPassword())); //TODO
			userService.save(userForm);
			return "redirect:/terminarz";			
		}
	}
	
    @RequestMapping(value = "/logowanie", method = RequestMethod.GET)
    public String login(Model model, String error) {
        if (error != null)
            model.addAttribute("error", "Login lub hasło jest niepoprawne.");
        return "login";
    }
    
	@RequestMapping(value = "/terminarz", method = RequestMethod.GET)
	public String terminarz(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findByUsername(auth.getName());				
		model.addAttribute("user", user);
		model.addAttribute("carForm", new Car());

		
		return "account";

	}

}