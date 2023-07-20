package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.AddressBean;
import it.unisa.model.AddressDaoImpl;
import it.unisa.model.UserBean;
import it.unisa.model.UserDaoImpl;

@WebServlet("/AddressControl")
public class AddressControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	static AddressDaoImpl addressDao = new AddressDaoImpl();
	static UserDaoImpl userDao = new UserDaoImpl();
       
    public AddressControl() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AddressBean address = new AddressBean();
		
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		
		if(user != null)
		{
			address.setCap(request.getParameter("cap"));
			address.setCitta(request.getParameter("citta"));
			address.setId_utente(user.getId());
			address.setNumCivico(request.getParameter("numCivico"));
			address.setProvincia(request.getParameter("provincia"));
			address.setStato(request.getParameter("stato"));
			address.setVia(request.getParameter("via"));
			
			System.out.println(address.toString());

		
			try {
				addressDao.saveAddress(address);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else
			System.out.println("NOOO TELECAMERA");
		
		response.sendRedirect("AddressForm.jsp");
    	
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
