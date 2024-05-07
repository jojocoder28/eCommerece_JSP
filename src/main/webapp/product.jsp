<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.ecommerce.model.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product</title>
<%@ include file="./icon.jsp" %>
</head>
<body>
	<%@ include file="./nav.jsp" %>
	<%@ include file="./mini_nav.jsp" %>
	
	<div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
      <%
      
      try {
    	  ProductDao pd=new ProductDao();
    	   ResultSet rs=pd.selectall();
		
      
      while(rs.next()){
    	  String pid=rs.getString(1);
    	  String pname=rs.getString(2);
    	  String price=rs.getString(3);
    	  String imadd=rs.getString(4); %>
      
        <div class="col">
          <div class="card shadow-sm">
            <img class="bd-placeholder-img card-img-top text-center mx-auto" style="display: flex; position:relative; width:auto; height:300px; padding:20px;"  src="<%=imadd %>" role="img" preserveAspectRatio="xMidYMid slice" focusable="false"></img>
            <div class="card-body">
              <p class="card-text"><%=pname %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                <%if(email==null){ %>
                  <a href="login.jsp"><button type="button" class="btn btn-sm btn-outline-secondary">Add to cart</button></a>
                <%}else{ %>
                <form action="addcart.jsp" method="post">
                <input name="pid" value="<%=pid %>" style="display:none">
                <button type="submit" class="btn btn-sm btn-outline-secondary">View Product</button>
                </form>
                <%} %>
                </div>
                <small class="text-body-secondary" id="price">&#8377;<%=price %></small>
              </div>
            </div>
          </div>
        </div>
        
        
        <%}
      }catch(Exception e) {}
      %>
        
        
        
        
        
        
        
      </div>
    </div>
  </div>
  
  
  
</body>
</html>