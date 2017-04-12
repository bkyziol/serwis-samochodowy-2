package pl.bartosz_kyziol.serwis.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import pl.bartosz_kyziol.serwis.models.Visit;

@Transactional
public interface VisitsRepository extends CrudRepository<Visit, Long> {

	public Visit findById(long id);
	
	public List<Visit> findByCarId(long carId);
	
}
