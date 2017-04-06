package pl.bartosz_kyziol.serwis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.repository.UserRepository;

@Controller
public class UserController {
	
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, Model model) {

        userRepository.save(userForm);
        model.addAttribute("userForm", userForm);
        return "welcome";
    }

}