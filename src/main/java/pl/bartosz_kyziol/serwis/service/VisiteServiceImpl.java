package pl.bartosz_kyziol.serwis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pl.bartosz_kyziol.serwis.models.Visit;
import pl.bartosz_kyziol.serwis.repository.VisitsRepository;

@Service
public class VisiteServiceImpl implements VisitService {

	@Autowired
    private VisitsRepository visitsRepository;

	@Override
	public void save(Visit visit) {
		visitsRepository.save(visit);
	}

	@Override
	public void delete(Visit visit) {
		visitsRepository.delete(visit);
	}

	@Override
	public Visit findById(long id) {
		return visitsRepository.findById(id);
	}
	@Override
	public List<Visit> findByDate(String date) {
		return visitsRepository.findByDate(date);
	}
	
	@Override
	public List<Visit> findByCarId(long carId) {
		List<Visit> visits = visitsRepository.findByCarId(carId);
		return visits;
	}

}
