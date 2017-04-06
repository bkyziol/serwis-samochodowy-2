package pl.bartosz_kyziol.serwis.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import pl.bartosz_kyziol.serwis.models.User;

@Transactional
public interface UserRepository extends CrudRepository<User, Long> {

  public User findByLogin(String login);

  public User findByEmail(String email);
  
}