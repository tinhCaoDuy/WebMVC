package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DetailCart")
public class DetailCart {

	@Id
	@GeneratedValue
	private int id;
	private int amount;
	private float sumprice;
	
	@ManyToOne
	@JoinColumn(name = "IDPro")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "IDCart")
	private Cart cart;

	public DetailCart() {
		super();
	}

	public DetailCart(int id, int amount, float sumprice, Product product, Cart cart) {
		super();
		this.id = id;
		this.amount = amount;
		this.sumprice = sumprice;
		this.product = product;
		this.cart = cart;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public float getSumprice() {
		return sumprice;
	}

	public void setSumprice(float sumprice) {
		this.sumprice = sumprice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	
}
