package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.Cart;
import it.unisa.model.ContenutoBean;
import it.unisa.model.ContenutoDaoImpl;
import it.unisa.model.OrderBean;
import it.unisa.model.OrderDaoImpl;
import it.unisa.model.ProductBean;
import it.unisa.model.UserBean;
import it.unisa.model.UserDaoImpl;


@WebServlet("/Ordine")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static UserDaoImpl userDao = new UserDaoImpl();
	private static OrderDaoImpl orderDao = new OrderDaoImpl();
	private static ContenutoDaoImpl contDao = new ContenutoDaoImpl();
	
    public OrderControl() {
        super();
      
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		Cart cart = (Cart) session.getAttribute("cart");
		String email = (String) session.getAttribute("user");
		String password = (String) session.getAttribute("psw");
		
		UserBean user = null;
		try {
			user = userDao.findByCred(email, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int idUtente = user.getId();
		
		String payment = req.getParameter("payment");
		int idIndirizzo = Integer.parseInt(req.getParameter("addressDropdown"));
		
		OrderBean order = new OrderBean(idUtente,idIndirizzo, cart.getPrezzoTotale(), LocalDate.now(), payment);
		
		try {
			orderDao.saveOrder(order);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int idOrdine = -1;
		
		try {
			idOrdine = orderDao.getIdfromDB();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		for(ProductBean prod : cart.getProducts())
		{
			System.out.println(prod.toString());
			try {
				contDao.saveContenuto(new ContenutoBean(idOrdine,prod.getCode(),prod.getQuantity(),22,prod.getPrice()));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("tutt appost");
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			
		doGet(req, res);
	}

}
