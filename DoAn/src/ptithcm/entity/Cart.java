package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Cart")
public class Cart {
	@Id
	@GeneratedValue
	private int id;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date date;
	
	private String status;
	
	@ManyToOne
	@JoinColumn(name = "ID_User")
	private NguoiDung nguoidung;
	
	@OneToMany(mappedBy = "cart",fetch = FetchType.EAGER)
	private Collection<DetailCart> detailCarts;

	public Cart() {
		super();
	}

	public Cart( Date date, String status, NguoiDung nguoidung, Collection<DetailCart> detailCarts) {
		super();
		this.date = date;
		this.status = status;
		this.nguoidung = nguoidung;
		this.detailCarts = detailCarts;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public Collection<DetailCart> getDetailCarts() {
		return detailCarts;
	}

	public void setDetailCarts(Collection<DetailCart> detailCarts) {
		this.detailCarts = detailCarts;
	}
	
	
	
}
