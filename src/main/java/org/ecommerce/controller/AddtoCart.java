package org.ecommerce.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ecommerce.study.Connectionclass;

/**
 * Servlet implementation class AddtoCart
 */
@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddtoCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid=request.getParameter("uid");
		String pid=request.getParameter("pid");
		String email=request.getParameter("email");
		String price=request.getParameter("price");
		String pname=request.getParameter("pname");
		String numcart=request.getParameter("numcart");
		String im_add=request.getParameter("im_add");
		if(uid==null) {
			response.sendRedirect("login.jsp");
		}
		Connection con=Connectionclass.createC();
		PreparedStatement pstm,pstm2;
		int num=Integer.parseInt(numcart)+1;
		String num1=String.valueOf(num);
		String cart=uid+num;
		try {
			pstm=con.prepareStatement("insert into cart values(?,?,?,?,?,?)");
		
			pstm.setString(1, cart);
			pstm.setString(2, uid);
			pstm.setString(3, pid);
			pstm.setString(4, pname);
			pstm.setString(5, price);
			pstm.setString(6, im_add);
			int i=pstm.executeUpdate();
			pstm2=con.prepareStatement("update userDB set \"n_cart\"='"+num1+"' where \"uid\"='"+uid+"'");
			/*
			 * pstm2.setString(1, num1); pstm2.setString(2, uid);
			 */
			int j=pstm2.executeUpdate();
			if(i!=0 && j!=0) {
				
				response.sendRedirect("product.jsp?msg=valid");
			}else {
				response.sendRedirect("product.jsp?msg=invalid");
			}
		} catch (SQLException e) {}
		
	}

}
