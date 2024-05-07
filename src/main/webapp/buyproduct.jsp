<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.ecommerce.model.dao.*" %>
<%String pid=request.getParameter("pid");
String price=request.getParameter("price");
String cid=request.getParameter("cid");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Product</title>
<%@ include file="./icon.jsp" %>

</head>
<body>
<%@ include file="./nav.jsp" %>
	<%@ include file="./mini_nav.jsp" %>
<div class="d-lg-flex">
<div class="container">
<div class="row align-items-center justify-content-center">
<div class="col-lg-10 py-5">
<h3>Delivery Details</h3>
<p class="mb-4">Confirm your order by providing correct information.</p>
<form action="ConfirmBuy" method="post">
<div class="row">
<div class="col-md-12">
<div class="form-group first">
<label for="fname">Full Name</label>
<input type="text" name="fname" class="form-control" placeholder="e.g. John" id="fname">
</div>
</div>
</div>
<div class="row">
<div class="col-md-12">
<div class="form-group first">
<label for="email">Address</label>
<input type="text" name="address" class="form-control" placeholder="e.g. john@your-domain.com" id="email">
</div>
</div>
</div>
<div class="row">
<div class="col-md-6">
<div class="form-group first">
<label for="lname">Phone Number</label>
<input type="text" name="phone_no" class="form-control" placeholder="10-digit phone number" id="lname">
</div>
</div>
<div class="col-md-6">
<div class="form-group first">
<label for="lname">Pin</label>
<input type="text" name="pin" class="form-control" placeholder="6-digit pincode" id="lname">
</div>
</div>
</div>
<input name="uid" value="<%=uid %>" style="display:none;">
<input name="pid" value="<%=pid %>" style="display:none;">
<input name="cid" value="<%=cid %>" style="display:none;">
<input name="price" value="<%=price %>" style="display:none;">
<input name="cart" value="<%=cart %>" style="display:none">
<input type="submit" value="Place Order" class="btn px-5 btn-primary">
</form>
</div>
</div>
</div>
</div>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"85b92d889ecd7f74","version":"2024.2.1","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>

</body>
</html>