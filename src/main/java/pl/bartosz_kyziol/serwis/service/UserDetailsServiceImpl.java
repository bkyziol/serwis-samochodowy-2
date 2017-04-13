package pl.bartosz_kyziol.serwis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.bartosz_kyziol.serwis.models.User;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{
    
	@Autowired
    private UserService userService;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        User user = userService.findByUsername(login);

        return new org.springframework.security.core.userdetails.User(user.getLogin(), user.getPassword(), AuthorityUtils.createAuthorityList("USER".toString()));
    }

}