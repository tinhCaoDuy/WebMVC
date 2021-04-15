package ptithcm.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Cart;
import ptithcm.entity.DetailCart;
import ptithcm.entity.NguoiDung;
import ptithcm.entity.Product;
 
@Transactional
@Controller

public class GioHangController {
	@Autowired
	SessionFactory factory;
	
	List<DetailCart> listDetailCart = new ArrayList<DetailCart>();
	Map<Integer, List<DetailCart>> list = new HashMap<Integer, List<DetailCart>>();
	long millis = System.currentTimeMillis();
	java.sql.Date date = new java.sql.Date(millis);
	Cart cart =  new Cart();
	
	public NguoiDung getNguoiDung(HttpSession session) {
		int id = (int) session.getAttribute("id");
		Session session1 = factory.getCurrentSession();
		String hql = "FROM NguoiDung n WHERE n.id = '"+ id +"'";
		Query query = session1.createQuery(hql);
		NguoiDung nguoiDung = (NguoiDung) query.uniqueResult();
		return nguoiDung;
	}

	@RequestMapping(value = "cart")
	public String Cart(ModelMap model, HttpSession session) {
		int id = (int) session.getAttribute("id");
		
		if (list.containsKey(id)) {
			listDetailCart = list.get(id);
		}
		else {
			List<DetailCart> temp = new ArrayList<DetailCart>();
			listDetailCart = temp;
		}
		
		NguoiDung nguoiDung = getNguoiDung(session);
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		cart.setDate(date);
		cart.setNguoidung(nguoiDung);
		cart.setStatus("1");
		
		Session session1 = factory.getCurrentSession();
		String hql = "FROM Cart WHERE nguoidung.id = '" + id +"'";
		Query query = session1.createQuery(hql);
		List<Cart> l = query.list();
		int n=l.size();
		model.addAttribute("number_cart", n);
		
		float total = 0;
		for (DetailCart number : listDetailCart) {
			float discount = (float) number.getProduct().getDiscount() / 100;
			float totaldiscount = number.getProduct().getPrice() * discount;
			float money = number.getProduct().getPrice() - totaldiscount;
			total += money * number.getAmount();
		}
		model.addAttribute("total", total);
		int size = listDetailCart.size();
		model.addAttribute("size", size);
		model.addAttribute("listDetailCart", listDetailCart);
		
		
		return "cart";

	}
	
	@RequestMapping(value = "add/{productId}", method = RequestMethod.POST)
	public String view(ModelMap mm, HttpSession session, @PathVariable("productId") int productId) {
		List<DetailCart> temp = new ArrayList<DetailCart>();
		String username = (String) session.getAttribute("username");
		
		int id = (int) session.getAttribute("id");
		if (list.containsKey(id)) {
			listDetailCart = list.get(id);
		}
		else {
			listDetailCart = temp;
		}
		
		NguoiDung nguoiDung = getNguoiDung(session);
		long millis = System.currentTimeMillis();
		java.sql.Date date = new java.sql.Date(millis);
		cart.setDate(date);
		cart.setNguoidung(nguoiDung);
		cart.setStatus("1");
		
		boolean flag = true;
		
		for (DetailCart item : listDetailCart) {
			if (item.getProduct().getId() == productId) {
				flag = false;
				item.setAmount(item.getAmount() + 1);
				float discount = (float) (item.getProduct().getDiscount() * 1.0 / 100);
				float tongtien1 = item.getProduct().getPrice() * discount;
				float tongtien = (item.getProduct().getPrice() - tongtien1) * item.getAmount();
				item.setSumprice(tongtien);
				break;
			}
		}
		
		if (flag) {
			Session session1 = factory.getCurrentSession();
			String hql = "FROM Product p WHERE p.id = '"+ productId +"'";
			Query query = session1.createQuery(hql);
			Product product = (Product) query.uniqueResult();
			DetailCart detailCart = new DetailCart();
			detailCart.setProduct(product);
			detailCart.setAmount(1);
			float discount = (float) (detailCart.getProduct().getDiscount()*1.0 / 100);
			float tongtien1 = detailCart.getProduct().getPrice() * discount;
			float tongtien = (detailCart.getProduct().getPrice() - tongtien1) * detailCart.getAmount();
			detailCart.setSumprice(tongtien);
			
			
			detailCart.setCart(cart);
			
			listDetailCart.add(detailCart);
			
		}
		temp = listDetailCart;
		list.put(id, temp);
		return "redirect:/cart.htm";
	}

	@RequestMapping(value = "move/{proId}", method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("proId") int proId, HttpSession session1) {
		for (DetailCart item : listDetailCart) {
			if (item.getProduct().getId() == proId) {
				listDetailCart.remove(item);
				break;
			}
		}
		
		return "redirect:/cart.htm";
	}

	@RequestMapping(value = "increase/{productId}", method = RequestMethod.GET)
	public String increase(ModelMap mm, HttpSession session, @PathVariable("productId") int productId) {
		for(DetailCart item : listDetailCart) {
			if (item.getProduct().getId() == productId) {
				item.setAmount(item.getAmount() + 1);
				float discount = (float) (item.getProduct().getDiscount() * 1.0 / 100);
				float tongtien1 = item.getProduct().getPrice() * discount;
				float tongtien = (item.getProduct().getPrice() - tongtien1) * item.getAmount();
				item.setSumprice(tongtien);
				break;
			}
		}

		return "redirect:/cart.htm";
	}

	@RequestMapping(value = "decrease/{productId}", method = RequestMethod.GET)
	public String decrease(ModelMap mm, HttpSession session, @PathVariable("productId") int productId) {
		for (DetailCart item : listDetailCart) {
			if (item.getProduct().getId() == productId) {
				if (item.getAmount() > 1) {
					item.setAmount(item.getAmount() - 1);
					float discount = (float) (item.getProduct().getDiscount() * 1.0 / 100);
					float tongtien1 = item.getProduct().getPrice() * discount;
					float tongtien = (item.getProduct().getPrice() - tongtien1) * item.getAmount();
					item.setSumprice(tongtien);
				}
				break;
			}
		}

		return "redirect:/cart.htm";
	}

	@RequestMapping(value = "confirm")
	public String confirm(ModelMap model, HttpSession session) {
		String username = (String) session.getAttribute("username");

		if (username == null) {
			return "error";
		}
		int id = (int) session.getAttribute("id");
		int cart1 = 0;

		float money = 0;
		for (DetailCart item : listDetailCart) {
			
			money += item.getSumprice();

		}
		model.addAttribute("list", listDetailCart);
		model.addAttribute("money", money);
		int size = listDetailCart.size();
		model.addAttribute("size", size);
		//session.setAttribute("cart1", cart1);
		return "confirm_cart";
	}

	@RequestMapping(value = "buy")
	public String buy(ModelMap model, HttpSession session) {
		String username = (String) session.getAttribute("username");

		if (username == null) {
			return "error";
		}
		
		
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		try {
			session1.save(cart);
			t.commit();
			model.addAttribute("message", "Mua Hàng Thành Công");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Mua hàng Thất Bại");
		}
		finally {
			session1.close();
		}
		
		
		for (DetailCart item : listDetailCart) {
			session1 = factory.openSession();
			t = session1.beginTransaction();
			try {
				session1.save(item);
				t.commit();
			} catch (Exception e) {
				t.rollback();
			}
			finally {
				session1.close();
			}
		}
		
		int id = (int) session.getAttribute("id");
		listDetailCart.clear();
		list.remove(id);

		return "buy";
	}

	@RequestMapping(value = "history/{id}")
	public String history(ModelMap model, HttpSession session, @PathVariable("id") int id) {
		
		Session session1 = factory.getCurrentSession();
		Query query = session1.createQuery("FROM Cart WHERE nguoidung.id = '" + id+"'");
		List<Product> listCart = query.list();
		model.addAttribute("listCart", listCart);
		return "history";
	}
	
	@RequestMapping(value = "history_cart/{idCart}")
	public String historyCart(ModelMap model, HttpSession session, @PathVariable("idCart") int idCart) {	

		Session session1 = factory.getCurrentSession();
		String hql2 = "FROM DetailCart WHERE cart.id = '" + idCart + "'";
		Query query2 = session1.createQuery(hql2);
		List<DetailCart> listItem =  query2.list();
		model.addAttribute("listItem", listItem);
		
		float total=0;
		for (DetailCart number : listItem) {
			total += number.getSumprice();
		}
		model.addAttribute("total", total);
		return "history_cart";

	}
}
