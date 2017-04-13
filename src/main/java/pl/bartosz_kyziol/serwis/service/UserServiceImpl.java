package pl.bartosz_kyziol.serwis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.bartosz_kyziol.serwis.models.User;
import pl.bartosz_kyziol.serwis.repository.UsersRepository;

@Service
public class UserServiceImpl implements UserService {
    
	@Autowired
    private UsersRepository usersRepository;

    @Override
    public void save(User user) {
        usersRepository.save(user);
    }
    
    @Override
    public User findById(long id) {
        return usersRepository.findById(id);
    }
    
    @Override
    public User findByUsername(String login) {
        return usersRepository.findByLogin(login);
    }

	@Override
	public User findByEmail(String email) {
        return usersRepository.findByEmail(email);
	}

}