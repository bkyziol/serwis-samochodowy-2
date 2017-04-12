package pl.bartosz_kyziol.serwis.models;

import javax.persistence.*;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "users")
public class User {

	private long id;
	private String login;
	private String password;
	private String passwordConfirm;
	private String email;
	private String phone;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Transient
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", login=" + login + ", password=" + password + ", email=" + email + ", phone="
				+ phone + "]";
	}


}