package ptithcm.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.Cart;
import ptithcm.entity.Category;
import ptithcm.entity.NguoiDung;
import ptithcm.entity.Product;


@Transactional
@Controller
public class HomeController {
	@Autowired
	SessionFactory factory;
	
	String search = "";
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		List<Product> list;
		List<Product> listStart;
		String hql = "FROM Product WHERE ttx = 1 and category.id ='1'";
		Query query = session.createQuery(hql);
		list = query.list();
		Collections.reverse(list);
		listStart = list.subList(0, 4);
		model.addAttribute("son", listStart);
		
		hql = "FROM Product WHERE ttx = 1 and category.id ='2'";
		query = session.createQuery(hql);
		list = query.list();
		Collections.reverse(list);
		listStart = list.subList(0, 4);
		model.addAttribute("ximang", listStart);
		
		hql = "FROM Product WHERE ttx = 1 and category.id ='3'";
		query = session.createQuery(hql);
		list = query.list();
		Collections.reverse(list);
		listStart = list.subList(0, 4);
		model.addAttribute("ongnuoc", listStart);
		
		hql = "FROM Product WHERE ttx = 1 and category.id ='4'";
		query = session.createQuery(hql);
		list = query.list();
		Collections.reverse(list);
		listStart = list.subList(0, 4);
		model.addAttribute("gach", listStart);
	
		return "index";
	}
	


	public List<Product> getList(int start, int end, int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("FROM Product WHERE ttx = 1 AND category.id =:id");
			query.setParameter("id", id);
			query.setFirstResult(start);
			query.setMaxResults(end);
			List<Product> list = query.list();
			t.commit();
			return list;
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return null;
	}

	public int gettotalPro(int id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Query query = session.createQuery("SELECT count(*) FROM Product WHERE ttx = 1 AND category.id =:id");
			query.setParameter("id", id);
			Long obj = (Long) query.uniqueResult();
			t.commit();
			return obj.intValue();
		} catch (Exception ex) {
			if (t != null) {
				t.rollback();
			}
			ex.printStackTrace();
		} finally {
			session.flush();
			session.close();
		}
		return 0;
	}

	
	@RequestMapping(value = "vattu/{page}", method = RequestMethod.GET)
	public String view(ModelMap model,HttpServletRequest request,@PathVariable("page") int page) {
		int lineCount = 8;
		Session session = factory.getCurrentSession();
		String hql = "FROM Product WHERE ttx = 1";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		int firstIndex = (page -1)*lineCount;
		int lastIndex = (page*lineCount > list.size()) ? list.size() : page*lineCount;
		list = list.subList(firstIndex, lastIndex);
		
		hql = "SELECT count(*) FROM Product p WHERE p.ttx = 1";
		query = session.createQuery(hql);
		long totalPro = (long) query.uniqueResult();
		model.addAttribute("listProduct", list);
		model.addAttribute("totalPage", (totalPro % lineCount == 0) ? totalPro / lineCount : totalPro / lineCount + 1);
		model.addAttribute("currentPage", page);
		
		return "vattu";
	}
	
	@RequestMapping(value = "vattu/{id}/{page}", method = RequestMethod.GET)
	public String viewProductList(ModelMap model, @PathVariable("id") int id,
			@PathVariable("page") int page) {

		int lineCount = 8;
		
		Session session = factory.getCurrentSession();
		String hqlCate = "FROM Category WHERE id = :id";
		Query queryCate = session.createQuery(hqlCate);
		queryCate.setParameter("id", id);
		Category cate = (Category) queryCate.uniqueResult();
		String name = cate.getName();
		model.addAttribute("idCate", id);
		model.addAttribute("nameCate", name);
		
		model.addAttribute("listProduct", getList((page - 1) * lineCount, lineCount, id));
		model.addAttribute("totalPage", (gettotalPro(id) % lineCount == 0) ? gettotalPro(id) / lineCount : gettotalPro(id) / lineCount + 1);
		model.addAttribute("currentPage", page);
		model.addAttribute("cateId", id);
	
		Category category = (Category) session.get(Category.class, id);
		model.addAttribute("category", category);

		return "vattu";
	}
	
	
	@RequestMapping(value = "search/{page}",method=RequestMethod.POST)
	public String search(ModelMap model,HttpServletRequest request,@PathVariable("page") int page) {
		
		int lineCount = 8;
		
		String data = (String) request.getParameter	("search");
		if (data != null) search = data;
		Session session = factory.getCurrentSession();
		String hql = "FROM Product WHERE ttx = 1";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		List<Product> list_search = new ArrayList<Product>();
		
		if (list.size() !=0) {
			for(Product item : list) {
				if (item.getName().contains(search)) list_search.add(item);
			}
			int totalPro = list_search.size();
			int firstIndex = (page -1)*lineCount;
			int lastIndex = (page*lineCount > list_search.size()) ? list_search.size() : page*lineCount;
			list_search = list_search.subList(firstIndex, lastIndex);
			
			model.addAttribute("listProduct", list_search);
			int totalPage = (totalPro % lineCount == 0) ? totalPro / lineCount : totalPro / lineCount + 1;
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("currentPage", page);
		}
		else {
			model.addAttribute("listProduct", 0);
			model.addAttribute("totalPage", 0);
			model.addAttribute("currentPage",0);
		}
		return "search";
	}
	
}
