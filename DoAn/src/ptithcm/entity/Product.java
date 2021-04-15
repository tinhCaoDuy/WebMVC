package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "Product")
public class Product {

	@Id
	@GeneratedValue
	private int id;
	private String name;
	private Float price;
	private String unit;
	private Integer discount;
	private String description;
	private String image;
	private int ttx;
	
	@ManyToOne
	@JoinColumn(name = "IDCategory")
	private Category category;
	
	@OneToMany(mappedBy = "product")
	private Collection<DetailCart> detailCarts;

	public Product() {
		super();
	}

	public Product(int id, String name, Float price,String unit, int discount, String description, String image,int ttx, Category category,
			Collection<DetailCart> detailCarts) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.unit = unit;
		this.discount = discount;
		this.description = description;
		this.image = image;
		this.ttx = ttx;
		this.category = category;
		this.detailCarts = detailCarts;
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

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}	
	
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}	

	public int getTtx() {
		return ttx;
	}

	public void setTtx(int ttx) {
		this.ttx = ttx;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Collection<DetailCart> getDetailCarts() {
		return detailCarts;
	}

	public void setDetailCarts(Collection<DetailCart> detailCarts) {
		this.detailCarts = detailCarts;
	}
	
	
}
