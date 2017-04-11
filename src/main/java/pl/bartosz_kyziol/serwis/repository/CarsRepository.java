package pl.bartosz_kyziol.serwis.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import pl.bartosz_kyziol.serwis.models.Car;

@Transactional
public interface CarsRepository extends CrudRepository<Car, Long> {

	  public List<Car> findByOwner(long owner);
	  
	  public Car findById(long id);
}
