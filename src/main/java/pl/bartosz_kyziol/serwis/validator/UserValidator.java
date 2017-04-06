package pl.bartosz_kyziol.serwis.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.repository.UserRepository;

@Component
public class UserValidator implements Validator {
    
	@Autowired
    private UserRepository userRepository;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "login", "login.NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordConfirm", "passwordConfirm.NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email.NotEmpty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "phone.NotEmpty");

        if (!user.getPasswordConfirm().equals(user.getPassword()) && user.getPassword().length() > 0) {
            errors.rejectValue("passwordConfirm", "password.diffrent");
            errors.rejectValue("password", "password.diffrent");
        }        
        if (user.getLogin().length() > 50) {
            errors.rejectValue("login", "login.toLong");
        }
        if (userRepository.findByLogin(user.getLogin()) != null) {
            errors.rejectValue("login", "login.duplicated");
        }
        if (user.getPassword().length() > 50) {
            errors.rejectValue("passwordConfirm", "password.toLong");
        }
        if (user.getEmail().length() > 50) {
            errors.rejectValue("emailConfirm", "email.toLong");
        }
        if (user.getPhone().length() > 50) {
            errors.rejectValue("phone", "phone.toLong");
        }
        
        
		
	}

}
