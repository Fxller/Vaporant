package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.AddressBean;
import it.unisa.model.AddressDaoImpl;

@WebServlet("/AddressControl")
public class AddressControl extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	static AddressDaoImpl addressDao = new AddressDaoImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressControl() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AddressBean address = new AddressBean();
		
		address.setCap(request.getParameter("cap"));
		address.setCitta(request.getParameter("citta"));
		address.setId(Integer.parseInt(request.getParameter("ID")));
		address.setId_utente(Integer.parseInt(request.getParameter("ID_Utente")));
		address.setNumCivico(request.getParameter("numCivico"));
		address.setProvincia(request.getParameter("provincia"));
		address.setStato(request.getParameter("stato"));
		address.setVia(request.getParameter("via"));

//		int result = 0;
//		
//		try {
//			result = addressDao.saveAddress(address);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
//		if(result > 0)
//			response.sendRedirect("AddressForm.jsp");
//		else 
//			response.sendRedirect("AddressForm.jsp");
		response.sendRedirect("AddressForm.jsp");
	}

}
