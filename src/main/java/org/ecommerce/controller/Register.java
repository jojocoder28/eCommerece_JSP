package org.ecommerce.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ecommerce.study.Connectionclass;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Register() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid=request.getParameter("uname");
		String fullname=request.getParameter("fname");
		String email=request.getParameter("email");
		String password=request.getParameter("pswd");
		
		if(uid==null || fullname==null || email==null || password==null) {
			response.sendRedirect("register.jsp?msg=invalid");
		}
		
		Connection con=Connectionclass.createC();
		PreparedStatement pstm;
		try {
			pstm=con.prepareStatement("select * from userDB where \"uid\" = '"+uid+"'");
			ResultSet rs=pstm.executeQuery();
			if (rs.next()) {
				response.sendRedirect("register.jsp?msg=uexists");
			}else {
				pstm=con.prepareStatement("select * from userDB where \"email\" = '"+email+"'");
				rs=pstm.executeQuery();
				if (rs.next()) {
					response.sendRedirect("register.jsp?msg=eexists");
				}else {
			pstm=con.prepareStatement("insert into userDB values(?,?,?,?,0)");
			pstm.setString(1, uid);
			pstm.setString(2, fullname);
			pstm.setString(3, email);
			pstm.setString(4, password);
			int i=pstm.executeUpdate();
			if(i!=0) {
				response.sendRedirect("register.jsp?msg=valid");
			}else {
				response.sendRedirect("register.jsp?msg=invalid");
			}}}
		}catch(Exception e) {}
	}

}
