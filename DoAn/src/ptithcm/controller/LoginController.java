package ptithcm.controller;

import java.util.List;
import java.util.regex.Pattern;

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

import ptithcm.entity.Cart;
import ptithcm.entity.Category;
import ptithcm.entity.NguoiDung;
import ptithcm.entity.Product;
import ptithcm.controller.GioHangController;
import sun.misc.Contended;

@Controller
@Transactional
public class LoginController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("login")
	public String login(ModelMap model) {
		model.addAttribute("user", new NguoiDung());
		return "login";
	}
	
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String doLogin(ModelMap mm, @ModelAttribute("user") NguoiDung user, HttpSession session1, BindingResult errors) {
		if (user.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user", "Vui lòng nhập email!");
		}
		if (user.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user", "Vui lòng nhập mật khẩu!");
		}
		if (errors.hasErrors()) {
			mm.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
		} else {
			Session session = factory.getCurrentSession();
			Query query = session.createQuery("FROM NguoiDung WHERE email = '" + user.getEmail() + "'");
			NguoiDung x = (NguoiDung) query.uniqueResult();
			if (x != null) {
				String pw = x.getPassword();
				int role = x.getIsad();
				String name = x.getName();
				String username = x.getUsername();
				int id = x.getId();
				String address = x.getAddress();
				int phone = x.getPhone();
				if ((user.getPassword().equals(pw)) && (role != 1)) {
					session1.setAttribute("name", name);
					session1.setAttribute("username", username);
					session1.setAttribute("roleid", role);
					session1.setAttribute("id", id);
					session1.setAttribute("address", address);
					session1.setAttribute("phone", phone);

					return "redirect:index.htm";
					
				} else if ((user.getPassword().equals(pw)) && (role == 1)) {
					session1.setAttribute("name", name);
					session1.setAttribute("username", username);
					session1.setAttribute("roleid", role);
					session1.setAttribute("id", id);
					session1.setAttribute("address", x.getAddress());
					session1.setAttribute("phone", x.getPhone());

					return "redirect:manage.htm";
				}
			}
			mm.addAttribute("message", "Tên đăng nhập hoặc mật khẩu chưa đúng! Mời nhập lại!");
		}
		return "login";
	}
	
	@RequestMapping("error")
	public String errorPage() {
		return "error";
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("user1", new NguoiDung());
		return "signup";
	}

	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user1") NguoiDung user1, HttpSession session1,
			BindingResult errors) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		String EMAIL_PATTERN = 
	            "^[a-zA-Z][\\w-]+@([\\w]+\\.[\\w]+|[\\w]+\\.[\\w]{2,}\\.[\\w]{2,})$";
	         
		if (user1.getName().trim().length() == 0) {
			errors.rejectValue("name", "user1", "Vui lòng nhập tên!");
		}
		if (user1.getEmail().trim().length() == 0) {
			errors.rejectValue("email", "user1", "Vui lòng nhập email!");
		} else if(Pattern.matches(EMAIL_PATTERN, user1.getEmail().trim())==false) {
			errors.rejectValue("email", "user1", "Vui lòng nhập đúng định dạng email!");
		}
		if (user1.getPassword().trim().length() == 0) {
			errors.rejectValue("password", "user1", "Vui lòng nhập password!");
		}
		if (user1.getUsername().trim().length() == 0) {
			errors.rejectValue("username", "user1", "Vui lòng nhập username!");
		}
		if (user1.getAddress().trim().length() == 0) {
			errors.rejectValue("address", "user1", "Vui lòng nhập địa chỉ!");
		}
		if (user1.getPhone() == 0) {
			errors.rejectValue("phone", "user1", "Vui lòng nhập số điện thoại!");
		}
		
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
		} else {
		try {
				session.save(user1);
				//t.commit();
				model.addAttribute("message", "Thêm mới thành công !");
	
			} catch (Exception e) {
				//t.rollback();
				model.addAttribute("message", "Thêm mới thất bại !");
			} finally {
				session.close();
			}
		}
		return "signup";
	}

	@RequestMapping(value = "signout")
	public String signout(HttpSession session) {
		session.removeAttribute("name");
		session.removeAttribute("username");
		session.removeAttribute("roleid");
		session.removeAttribute("id");
		session.removeAttribute("address");
		session.removeAttribute("phone");
		session.removeAttribute("cart");
		
		return "redirect:/index.htm";
	}
}
