package pl.bartosz_kyziol.serwis.service;

import java.util.List;

import pl.bartosz_kyziol.serwis.models.Car;

public interface CarService {

	public void save(Car car);

	public void delete(Car car);
	
	public Car findById(long id);
	
	public List<Car> findByOwner(long owner);

	
}
