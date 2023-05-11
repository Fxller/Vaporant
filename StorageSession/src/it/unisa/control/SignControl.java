package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.UserBean;
import it.unisa.model.UserDaoImpl;

@WebServlet("/SignControl")
public class SignControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static UserDaoImpl userDao = new UserDaoImpl();
       
    public SignControl() {
        super();
        
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UserBean user = new UserBean();
		
		user.setNome(request.getParameter("nome"));
		user.setCognome(request.getParameter("cognome"));
		user.setDataNascita(LocalDate.parse(request.getParameter("data_nascita")));
		user.setCodF(request.getParameter("codice_fiscale"));
		user.setNumTelefono(request.getParameter("telefono"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));

		
		int result = 0;
		
		try {
			result = userDao.saveUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result > 0)
			response.sendRedirect("loginForm.jsp");
		else 
			response.sendRedirect("SignForm.jsp");
	}

}
