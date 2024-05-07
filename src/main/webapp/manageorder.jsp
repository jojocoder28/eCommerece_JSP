
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
<%@ include file="./icon.jsp" %>
<title>Manage Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
</head>
<body>
<%if("valid".equals(str)){ %>
<script>
    alert("Order delivered Successfully");
</script>
<!-- <div class="text-success">
<h4>Registration Successful</h4></div> -->
<%}else if("invalid".equals(str)){ %>
<script>
    alert("Error occurred, please retry!!");
</script>
<%} %>
<div class="container">
<a href="admin.jsp" class="h4" style="text-decoration:none;">Click here for Admin Homepage</a>
<h1 class="h1">Pending orders...</h1>
<table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>PID</th>
                  <th>Product Name</th>
                  <th>Price</th>
                  <th>Address</th>
                  <th>Phone</th>
                  <th>Action</th>
                </tr>
              </thead>
	<%
      
      try {
    	  PurchaseDao pd=new PurchaseDao();
    	   ResultSet rs=pd.selectall();
    	   int i=0;
		
      
      while(rs.next()){
    	  i+=1;
    	  String pid=rs.getString(2);
    	  String pname=rs.getString(3);
    	  String price=rs.getString(7);
    	  String address=rs.getString(4);
    	  String phn=rs.getString(5);%>
    	  
    	  
              <tbody>
                <tr>
                  <td><%=i %></td>
                  <td><%=pid %></td>
                  <td><%=pname %></td>
                  <td>&#8377; <%=price %></td>
                  <td><%=address %></td>
                  <td><%=phn %></td>
                  <td><form action="#" method="post"><input name="pid" value="<%=pid %>" style="display:none"><button type="submit" class="btn btn-primary btn-block">No use</button></form></td>
                </tr>
                
              
    	  
    	  
    	  
    	  
    	  
    	  
     <%}
      }catch(Exception e) {}
      %>
      </tbody>
     </table>
   </div>
</body>
</html>