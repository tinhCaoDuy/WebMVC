package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "NguoiDung")
public class NguoiDung {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String email;
	private int phone;
	private String address;
	private String username;
	private String password;
	private int isad;
	
	@OneToMany(mappedBy = "nguoidung",fetch = FetchType.EAGER)
	private Collection<Cart> carts;
	
	public NguoiDung() {
		super();
	}
	
	
	
	public Collection<Cart> getCarts() {
		return carts;
	}



	public void setCarts(Collection<Cart> carts) {
		this.carts = carts;
	}



	public NguoiDung(int id, String name, String email, int phone, String address, String username, String password,
			int isad, Collection<Cart> carts) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.username = username;
		this.password = password;
		this.isad = isad;
		this.carts = carts;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIsad() {
		return isad;
	}
	public void setIsad(int isad) {
		this.isad = isad;
	}
	
	
}
