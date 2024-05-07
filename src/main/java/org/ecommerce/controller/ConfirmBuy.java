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
 * Servlet implementation class ConfirmBuy
 */
@WebServlet("/ConfirmBuy")
public class ConfirmBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmBuy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cid=request.getParameter("cid");
		String uid=request.getParameter("uid");
		String pid=request.getParameter("pid");
		String fname=request.getParameter("fname");
		String address=request.getParameter("address");
		String phone_no=request.getParameter("phone_no");
		String pin=request.getParameter("pin");
		String price=request.getParameter("price");
		String cart=request.getParameter("cart");
		int cart2=Integer.parseInt(cart)-1;
		cart=String.valueOf(cart2);
		Connection con=Connectionclass.createC();
		PreparedStatement pstm,pstm2,pstm3;
		try {
			pstm=con.prepareStatement("insert into purchase values('"+uid+"','"+pid+"','"+fname+"','"+address+"','"+phone_no+"','"+pin+"','"+price+"')");
			
			int i=pstm.executeUpdate();
			if(i!=0) {
				pstm3=con.prepareStatement("delete from cart where \"cid\"='"+cid+"'");
				//System.out.print(cid);
				pstm3.executeUpdate();
				pstm2=con.prepareStatement("update userDB set \"n_cart\"='"+cart+"' where \"uid\"='"+uid+"'");
				pstm2.executeUpdate();
				response.sendRedirect("index.jsp?msg=buysuccess");
			}else {
				response.sendRedirect("cart.jsp?msg=invalid");
			}
		}catch(Exception e) {System.out.print(e);}
	}

}
