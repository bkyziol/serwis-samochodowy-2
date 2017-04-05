package pl.bartosz_kyziol.serwis.models;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

@Transactional
public interface UserDao extends CrudRepository<User, Long> {

  public User findByLogin(String login);

  public User findByEmail(String email);
  
}