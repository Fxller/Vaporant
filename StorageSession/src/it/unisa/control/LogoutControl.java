package it.unisa.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logoutControl")
public class LogoutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutControl() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			req.getSession().invalidate();
			HttpSession currentSession = req.getSession();
			currentSession.setAttribute("user", null);
			currentSession.setAttribute("psw", null);
			currentSession.setAttribute("tipo", null);
			currentSession.setAttribute("cart", null);
		
			resp.sendRedirect("loginForm.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
