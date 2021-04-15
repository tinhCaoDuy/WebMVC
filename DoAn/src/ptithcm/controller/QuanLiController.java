package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.entity.Cart;
import ptithcm.entity.DetailCart;
import ptithcm.entity.NguoiDung;
import ptithcm.entity.Product;


@Transactional
@Controller
public class QuanLiController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("manage")
	public String manage(ModelMap model, HttpSession session1) {
		return "manage";
	}
	
	@RequestMapping(value="manageproduct")
	public String manageProductList(ModelMap model, HttpSession session1) {
    	Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Product p WHERE p.ttx = 1");
		List<Product> list = query.list();
		int totalitems=list.size();
		model.addAttribute("listProduct", list);
		model.addAttribute("totalitems", totalitems);
	
		return "manageproduct";
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model, HttpSession session1) {
		model.addAttribute("product", new Product());
		return "manageproduct_form";
	}

	@RequestMapping(value = "insert", params = "btnCapNhat")
	public String insert(ModelMap model, @ModelAttribute("product") Product product,@RequestParam("photo") MultipartFile photo, HttpSession session1,BindingResult errors) {
		
		if (product.getName().trim().length() ==0 ) {
			errors.rejectValue("name", "product", "Vui lòng nhập tên sản phẩm");
		}
		
		if (photo.getOriginalFilename().compareTo("") ==0) {
			errors.rejectValue("image", "prodcut", "Vui lòng chọn hình ảnh sản phẩm");
		}
		
		String price_pattern = "^[0-9]{*}";
		if (product.getPrice() == null) {
			errors.rejectValue("price", "product", "Vui lòng nhập giá sản phẩm");
		}
		
		String discount_pattern = "^[0-9]{1}";
		if (product.getDiscount() == null) {
			errors.rejectValue("discount", "product", "Vui lòng nhập khuyến mãi");
		}
		
		if (product.getUnit().trim().length() == 0) {
			errors.rejectValue("unit", "product", "Vui lòng nhập đơn vị");
		}
		
		if (product.getDescription().trim().length() == 0) {
			errors.rejectValue("description", "product", "Vui lòng nhập thông tin");
		}
		
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		}
		else {
			String path = context.getRealPath("images/" + photo.getOriginalFilename());
			try {
				photo.transferTo(new File(path));
				String pathPhoto = "images/" + photo.getOriginalFilename();
				product.setImage(pathPhoto);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				product.setTtx(1);
				session.save(product);
				model.addAttribute("message", "Thêm thành công !");
				t.commit();
			} catch (Exception e) {
				model.addAttribute("message", "Thêm thất bại !");
			} finally {
				session.close();
			}
		}
		return "manageproduct_form";
	}
	
	@RequestMapping(value = "insert",params = "btnTroVe")
	public String trove() {
		return "redirect:manageproduct.htm";
	}
	
	@RequestMapping("editproduct")
	public String edit(ModelMap model, HttpServletRequest rq, HttpSession session1) {
		Session session = factory.getCurrentSession();
		int id = Integer.valueOf(rq.getParameter("id"));
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		return "manageproduct_update";
	}
	
	@RequestMapping(value = "editproduct",params = "btnCapNhat")
	public String edit1(ModelMap model,@ModelAttribute("product") Product product,@RequestParam("photo") MultipartFile photo, BindingResult error) {
		if (product.getName().trim().length() ==0 ) {
			error.rejectValue("name", "product", "Vui lòng nhập tên sản phẩm");
		}
		
		String price_pattern = "^[0-9]{*}";
		if (product.getPrice() == null) {
			error.rejectValue("price", "product", "Vui lòng nhập giá sản phẩm");
		}
		
		String discount_pattern = "^[0-9]{1}";
		if (product.getDiscount() == null) {
			error.rejectValue("discount", "product", "Vui lòng nhập khuyến mãi");
		}
		
		if (product.getUnit().trim().length() == 0) {
			error.rejectValue("unit", "product", "Vui lòng nhập đơn vị");
		}
		
		if (product.getDescription().trim().length() == 0) {
			error.rejectValue("description", "product", "Vui lòng nhập thông tin");
		}
		
		if (error.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		}
		else {
			//System.out.println(product.getTtx());
			if (photo.getOriginalFilename().compareTo("") != 0) {
				String path = context.getRealPath("images/" + photo.getOriginalFilename());
				try {
					photo.transferTo(new File(path));
					String pathPhoto = "images/" + photo.getOriginalFilename();
					product.setImage(pathPhoto);
				} catch (IllegalStateException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				product.setTtx(1);
				session.update(product);
				t.commit();
				model.addAttribute("message", "Sửa thành công !");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Sửa thất bại !");
			} finally {
				session.close();
			}
	}
		return "manageproduct_update";
	}
	
	@RequestMapping(value = "editproduct",params = "btnTroVe")
	public String edit2() {
		return "redirect:manageproduct.htm";
	}
	
	@RequestMapping("deleteproduct")
	public String delete(ModelMap model, HttpServletRequest rq) {
		int id = Integer.valueOf(rq.getParameter("id"));
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);
		model.addAttribute("product", product);
		return "manageproduct_delete";
	}
	
	@RequestMapping(value = "deleteproduct",params = "btnXacNhan")
	public String delete(ModelMap model, @ModelAttribute("product") Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			product.setTtx(0);
			session.update(product);
			t.commit();
			model.addAttribute("message", "Xóa thành công !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xóa thất bại !");
		} finally {
			session.close();
		}
		return "manageproduct_delete";
	}
	
	@RequestMapping(value = "deleteproduct",params = "btnTroVe")
	public String delete1() {
		return "redirect:manageproduct.htm";
	}
	
	@RequestMapping(value="managecart")
	public String managecart(ModelMap model, HttpSession session1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("FROM Cart");
		List<Cart> listCart = query.list();
		int totalitems=listCart.size();
		model.addAttribute("listCart", listCart);

		return "manage_cart";
	}
	
	@RequestMapping("detailcart")
	public String detaicart(ModelMap model, HttpServletRequest rq) {
		int id = Integer.valueOf(rq.getParameter("id"));
		Session session = factory.getCurrentSession();
//		Cart cart = (Cart) session.get(Cart.class, id);
//		String isPaid = cart.getStatus(); 
//		model.addAttribute("isPaid", isPaid);
//		model.addAttribute("id",id);
		
		String hql = "FROM DetailCart d WHERE d.cart.id = '" + id + "'";
		Query query = session.createQuery(hql);
		List<DetailCart> list = query.list();
		model.addAttribute("listItem", list);
		
		float total=0;
		for (DetailCart number : list) {
			total += number.getSumprice();
		}
		model.addAttribute("total", total);
		
		return "chart";
		
	}
}
