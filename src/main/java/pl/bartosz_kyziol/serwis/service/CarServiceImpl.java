package pl.bartosz_kyziol.serwis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.bartosz_kyziol.serwis.models.Car;
import pl.bartosz_kyziol.serwis.repository.CarsRepository;

@Service
public class CarServiceImpl implements CarService {

	@Autowired
	private CarsRepository carsRepository;

	@Override
	public void save(Car car) {	
		car.setBrand(car.getBrand().toUpperCase());
		car.setModel(car.getModel().toUpperCase());
		car.setRegistration_nr(car.getRegistration_nr().replaceAll("\\W","").toUpperCase());
		carsRepository.save(car);
	}

	@Override
	public List<Car> findByOwner(long owner) {
		return carsRepository.findByOwner(owner);
	}

	@Override
	public void delete(Car car) {
		carsRepository.delete(car);
	}

	@Override
	public Car findById(long id) {
		return carsRepository.findById(id);
	}
	
}
