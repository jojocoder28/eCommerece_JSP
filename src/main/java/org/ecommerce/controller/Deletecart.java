package org.ecommerce.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ecommerce.study.Connectionclass;

/**
 * Servlet implementation class Deletecart
 */
@WebServlet("/Deletecart")
public class Deletecart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletecart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = Connectionclass.createC();
		PreparedStatement pstm;
		String cid=request.getParameter("cid");
		String uid=request.getParameter("uid");
		String cart=request.getParameter("cart");
		int cart2=Integer.parseInt(cart)-1;
		cart=String.valueOf(cart2);
		try {
			pstm=con.prepareStatement("delete from cart where \"cid\"='"+cid+"'");
			int i=pstm.executeUpdate();
			if(i!=0) {
				pstm=con.prepareStatement("update userDB set \"n_cart\"='"+cart+"' where \"uid\"='"+uid+"'");
				pstm.executeUpdate();
				response.sendRedirect("cart.jsp?msg=valid");
			}else {
				response.sendRedirect("cart.jsp?msg=invalid");
			}
		}catch(Exception e) {}
	}

}
