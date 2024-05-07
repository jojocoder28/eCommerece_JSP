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
 * Servlet implementation class DeleteItem
 */
@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItem() {
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
		String pid=request.getParameter("pid");
		try {
			pstm=con.prepareStatement("delete from product where \"pid\"='"+pid+"'");
			int i=pstm.executeUpdate();
			if(i!=0) {
				response.sendRedirect("deleteitem.jsp?msg=valid");
			}else {
				response.sendRedirect("deleteitem.jsp?msg=invalid");
			}
		}catch(Exception e) {}
	}

}
