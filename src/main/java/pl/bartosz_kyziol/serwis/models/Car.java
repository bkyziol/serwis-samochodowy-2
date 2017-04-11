package pl.bartosz_kyziol.serwis.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "cars")
public class Car {
		
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@NotNull
	private String brand;
	
	@NotNull
	private String model;

	@NotNull
	private String registration_nr;

	@NotNull
	private long owner;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRegistration_nr() {
		return registration_nr;
	}

	public void setRegistration_nr(String registration_nr) {
		this.registration_nr = registration_nr;
	}


	public long getOwner() {
		return owner;
	}


	public void setOwner(long owner) {
		this.owner = owner;
	}

	@Override
	public String toString() {
		return "Car [id=" + id + ", brand=" + brand + ", model=" + model + ", registration_nr=" + registration_nr
				+ ", owner=" + owner + "]";
	}

	

}
