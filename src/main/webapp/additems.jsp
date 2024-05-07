<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="./icon.jsp" %>
<title>Add Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <style>
        .form{
            margin-top: 40px;
        }
    </style>
</head>
<body>

    <div class="container">
    <a href="admin.jsp" class="h4" style="top:20px; position:relative; text-decoration:none;">Click here for Admin Homepage</a>
    <form action="Additem" method="post" class="form">
        <div class="col-12">
            <label for="itemID" class="form-label">Product ID </label>
            <input type="text" class="form-control" name="pid" placeholder="Product ID(all in small letters)">
          </div>
        <div class="col-12">
            <label for="name" class="form-label">Product Name </label>
            <input type="text" class="form-control" name="pname" placeholder="Product name">
          </div>
          <div class="col-12">
            <label for="description" class="form-label">Price</label>
            <input type="text" class="form-control" name="price" placeholder="Product Price">
          </div>
          <div class="col-12">
            <label for="price" class="form-label">Image Address </label>
            <input type="text" class="form-control" name="im_add" placeholder="Image Address">
          </div>
          <hr>
          <div>
          <button class="btn btn-sm btn-outline-dark" type="submit">Add Item</button>
          </div>
    </form>
    </div>
</body>
</html>