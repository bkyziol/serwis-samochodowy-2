package pl.bartosz_kyziol.serwis.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.models.UserDao;

@Controller
public class UserController {

	@Autowired
	private UserDao userDao;

	@RequestMapping("/create")
	@ResponseBody
	public String create(String login, String password, String email, String phone) {
		User user = null;
		try {
			user = new User(login, password, email, phone);
			userDao.save(user);
		}
		catch (Exception ex) {
			return "Błąd w trakcie dodawania użytkownika do bazy: " + ex.toString();
		}
		return "Nowy użytkownik dodany (id = " + user.getId() + ").";
	}

	@RequestMapping("/delete")
	@ResponseBody
	public String delete(long id) {
		try {
			User user = new User(id);
			userDao.delete(user);
		}
		catch (Exception ex) {
			return "Błąd w trakcie usuwania użytkownika: " + ex.toString();
		}
		return "Użytkownik usunięty.";
	}

	@RequestMapping("/get-by-email")
	@ResponseBody
	public String getByEmail(String email) {
		String userId;
		try {
			User user = userDao.findByEmail(email);
			userId = String.valueOf(user.getId());
		}
		catch (Exception ex) {
			return "Nie znaleziono użytkownika";
		}
		return "Id użytkownika to: " + userId;
	}
	
	@RequestMapping("/get-by-login")
	@ResponseBody
	public String getByLogin(String login) {
		String userId;
		try {
			User user = userDao.findByLogin(login);
			userId = String.valueOf(user.getId());
		}
		catch (Exception ex) {
			return "Nie znaleziono użytkownika";
		}
		return "Id użytkownika to: " + userId;
	}


	@RequestMapping("/update")
	@ResponseBody
	public String updateUser(long id, String login, String password, String email, String phone) {
		try {
			User user = userDao.findOne(id);
			user.setLogin(login);
			user.setPassword(password);
			user.setEmail(email);
			user.setPhone(phone);
			userDao.save(user);
		}
		catch (Exception ex) {
			return "Error updating the user: " + ex.toString();
		}
		return "User succesfully updated!";
	}

}