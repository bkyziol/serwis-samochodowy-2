package pl.bartosz_kyziol.serwis.service;

import pl.bartosz_kyziol.serwis.models.User;

public interface UserService {
	
    void save(User user);
    
    User findById(long id);

    User findByUsername(String username);

    User findByEmail(String email);

}
