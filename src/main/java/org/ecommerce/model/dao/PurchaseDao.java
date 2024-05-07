package org.ecommerce.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.ecommerce.study.Connectionclass;

public class PurchaseDao {

	public ResultSet info(String pid) {
		Connection con=Connectionclass.createC();
		PreparedStatement pstm;
		ResultSet rs = null;
		try {
			pstm=con.prepareStatement("select * from purchase where \"pid\" = '"+pid+"'");
			rs=pstm.executeQuery();
		}catch(Exception e) {}
		return rs;
		}


	public ResultSet selectall() {
		Connection con=Connectionclass.createC();
		PreparedStatement pstm;
		ResultSet rs = null;
		try {
			pstm=con.prepareStatement("select * from purchase");
			rs=pstm.executeQuery();
		}catch(Exception e) {}
		return rs;
		}
}
