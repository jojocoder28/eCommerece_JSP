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
 * Servlet implementation class Additem
 */
@WebServlet("/Additem")
public class Additem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Additem() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid=request.getParameter("pid");
		String pname=request.getParameter("pname");
		String price=request.getParameter("price");
		String im_add=request.getParameter("im_add");
		Connection con=Connectionclass.createC();
		PreparedStatement pstm;
		
		try {
			pstm=con.prepareStatement("insert into product values('"+pid+"','"+pname+"','"+price+"','"+im_add+"')");
			/*
			 * pstm.setString(1, pid); pstm.setString(2, pname); pstm.setString(3, price);
			 * pstm.setString(4, im_add);
			 */
			int status=pstm.executeUpdate();
			if(status!=0) {
				response.sendRedirect("admin.jsp?msg=valid");
			}else {
				response.sendRedirect("admin.jsp?msg=invalid");
			}
			
		}catch(Exception e) {}
	}

}
