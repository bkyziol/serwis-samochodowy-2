package pl.bartosz_kyziol.serwis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    
	@Autowired
    private UserRepository userRepository;

    @Override
    public void save(User user) {
        user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword())); //TODO
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String login) {
        return userRepository.findByLogin(login);
    }

	@Override
	public User findByEmail(String email) {
        return userRepository.findByEmail(email);
	}
}