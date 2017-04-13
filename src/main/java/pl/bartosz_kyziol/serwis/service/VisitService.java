package pl.bartosz_kyziol.serwis.service;

import java.util.List;

import pl.bartosz_kyziol.serwis.models.Visit;

public interface VisitService {
	
	public void save(Visit visit);

	public void delete(Visit visit);
	
	public Visit findById(long id);
	
	public List<Visit> findByDate(String date);
	
	public List<Visit> findByCarId(long carId);
	

}
