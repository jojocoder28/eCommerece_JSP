package org.ecommerce.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.ecommerce.model.bean.UserBean;
import org.ecommerce.model.dao.UserDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pswd=request.getParameter("pswd");
		
		UserBean ub=new UserBean();
		ub.setEmail(email);
		ub.setPswd(pswd);
		
		UserDao ud=new UserDao();
		boolean status=ud.login(ub);
		ResultSet rs=ud.info(email);
		String name = null,uid=null,cart=null;
		try {
			while(rs.next()) {
			name=rs.getString(2);
			name=name.replace(" ", "_");
			uid=rs.getString(1);
			cart=rs.getString(5);}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (status) {
	        // Set a cookie to store the username
			String values[]= {email,name,uid,cart};
			String value=String.join("__", values);
			//System.out.print(value);
	        Cookie usernameCookie = new Cookie("email", value);
	        usernameCookie.setMaxAge(60 * 60 * 24 * 7); // Cookie valid for 1 week
	        response.addCookie(usernameCookie);

	        // Alternatively, store in session
	        HttpSession session = request.getSession();
	        session.setAttribute("email", email);

	        response.sendRedirect("index.jsp");
	    } else {
	        response.sendRedirect("login.jsp?error=1");
	    }
		
	}

}
