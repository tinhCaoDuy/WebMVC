package ptithcm.controller;

import java.util.List;

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

import ptithcm.entity.NguoiDung;
import ptithcm.entity.Product;


@Transactional
@Controller
public class SanPhamController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("single/{proId}")
	public String getSinglePage(ModelMap model, @PathVariable("proId") int proId) {
		model.put("user", new NguoiDung());
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		Query query = session.createQuery("FROM Product WHERE id =:id");
		query.setParameter("id", proId);
		Product x = (Product) query.uniqueResult();
		model.addAttribute("product", x);
		
		int cate=x.getCategory().getId();
		query = session.createQuery("FROM Product WHERE category.id ='"+cate+"'");
		List<Product> list = query.list();
		List<Product> listStart = list.subList(0, 4);
		model.addAttribute("lProduct", listStart);

		return "single";
	}
}
