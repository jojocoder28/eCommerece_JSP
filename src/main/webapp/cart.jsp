<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.ecommerce.model.dao.*" %>
<%String str=request.getParameter("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@ include file="./icon.jsp" %>
</head>
<body>
<%if("valid".equals(str)){ %>
<script>
    alert("Item has been deleted from your cart.");
</script>
<!-- <div class="text-success">
<h4>Registration Successful</h4></div> -->
<%}else if("invalid".equals(str)){ %>
<script>
    alert("Error occurred, please retry!!");
</script>
<%} %>
	<%@ include file="./nav.jsp" %>
	<%@ include file="./mini_nav.jsp" %>
	<%if(email==null){ 
	response.sendRedirect("login.jsp");}%>
	
	<div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
      <%
      
      try {
    	  CartDao cd=new CartDao();
    	   ResultSet rs=cd.info(uid);
			ResultSet rs3=cd.info(uid);
      if(!rs3.next()){
      %>
      <h1 class="text-center h1 mx-auto">Your cart is empty :')</h1>
      <%}else{
      while(rs.next()){
    	  String pid=rs.getString(3);
    	  String pname=rs.getString(4);
    	  String price=rs.getString(5);
    	  String imadd=rs.getString(6);
    	  String cid=rs.getString(1);%>
      
        <div class="col">
          <div class="card shadow-sm">
            <img class="bd-placeholder-img card-img-top text-center mx-auto" style="display: flex; position:relative; width:auto; height:300px; padding:20px;"  src="<%=imadd %>" role="img" preserveAspectRatio="xMidYMid slice" focusable="false"></img>
            <div class="card-body">
            <div class="row" style="margin-bottom:10px;">
              <span class="col d-flex card-text"><%=pname %></span>
              <span class="text-body-secondary col d-flex justify-content-end" id="price">&#8377;<%=price %></span>
              </div>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                <%if(email==null){ %>
                  <a href="login.jsp"><button type="button" class="btn btn-sm btn-outline-secondary">Buy Now</button></a>
                <%}else{ %>
                <form action="buyproduct.jsp" method="post">
                <input name="pid" value="<%=pid %>" style="display:none">
                <input name="price" value="<%=price %>" style="display:none">
                <input name="cid" value="<%=cid %>" style="display:none">
                <button type="submit" class="btn btn-sm btn-primary" >Buy Now</button>
                </form>
                <div class="d-flex" style="margin-left:30px;">
                <form action="Deletecart" method="post">
                <input name="cid" value="<%=cid %>" style="display:none">
                <input name="uid" value="<%=uid %>" style="display:none">
                <input name="cart" value="<%=cart %>" style="display:none">
                <button type="submit" class="btn btn-sm btn-outline-secondary">Remove from Cart</button>
                </form>
                </div>    
                <%} %>
                </div>
                
              </div>
            </div>
          </div>
        </div>
        
        
        <%}}
      }catch(Exception e) {}
      %>
        
        
        
        
        
        
        
      </div>
    </div>
  </div>
  
  
  
</body>
</html>