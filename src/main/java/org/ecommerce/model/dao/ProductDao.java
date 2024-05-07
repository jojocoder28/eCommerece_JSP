package org.ecommerce.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*import org.ecommerce.model.bean.UserBean;*/
import org.ecommerce.study.Connectionclass;

public class ProductDao {
	/*
	 * public boolean login(UserBean ub) { String email=ub.getEmail(); String
	 * pswd=ub.getPswd(); Connection con=Connectionclass.createC();
	 * PreparedStatement pstm; ResultSet rs; boolean status=false; try {
	 * pstm=con.prepareStatement("select * from userDB where \"email\" = '"
	 * +email+"' and \"pass\" = '"+pswd+"'"); //pstm.setString(1, email);
	 * //pstm.setString(2, pswd); rs=pstm.executeQuery(); status=rs.next();
	 * }catch(Exception e) {} return status; }
	 */
public ResultSet info(String pid) {
	Connection con=Connectionclass.createC();
	PreparedStatement pstm;
	ResultSet rs = null;
	try {
		pstm=con.prepareStatement("select * from product where \"pid\" = '"+pid+"'");
		rs=pstm.executeQuery();
	}catch(Exception e) {}
	return rs;
	}


public ResultSet selectall() {
	Connection con=Connectionclass.createC();
	PreparedStatement pstm;
	ResultSet rs = null;
	try {
		pstm=con.prepareStatement("select * from product");
		rs=pstm.executeQuery();
	}catch(Exception e) {}
	return rs;
	}
}


