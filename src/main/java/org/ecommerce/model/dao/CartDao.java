package org.ecommerce.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.ecommerce.study.Connectionclass;

public class CartDao {
	public ResultSet info(String uid) {
		Connection con=Connectionclass.createC();
		PreparedStatement pstm;
		ResultSet rs = null;
		try {
			pstm=con.prepareStatement("select * from cart where \"uid\" = '"+uid+"'");
			rs=pstm.executeQuery();
		}catch(Exception e) {}
		return rs;
		}


	public ResultSet selectall() {
		Connection con=Connectionclass.createC();
		PreparedStatement pstm;
		ResultSet rs = null;
		try {
			pstm=con.prepareStatement("select * from cart");
			rs=pstm.executeQuery();
		}catch(Exception e) {}
		return rs;
		}

}
