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
<title>Amazing Admin</title>
<%@ include file="./icon.jsp" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/jumbotron/">
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <%String str=request.getParameter("msg"); %>

    <style>
        .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          user-select: none;
        }
  
        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }
  
        .b-example-divider {
          height: 3rem;
          background-color: rgba(0, 0, 0, .1);
          border: solid rgba(0, 0, 0, .15);
          border-width: 1px 0;
          box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
  
        .b-example-vr {
          flex-shrink: 0;
          width: 1.5rem;
          height: 100vh;
        }
  
        .bi {
          vertical-align: -.125em;
          fill: currentColor;
        }
  
        .nav-scroller {
          position: relative;
          z-index: 2;
          height: 2.75rem;
          overflow-y: hidden;
        }
  
        .nav-scroller .nav {
          display: flex;
          flex-wrap: nowrap;
          padding-bottom: 1rem;
          margin-top: -1px;
          overflow-x: auto;
          text-align: center;
          white-space: nowrap;
          -webkit-overflow-scrolling: touch;
        }
      </style>
  
</head>
<body>
<%if("valid".equals(str)){ %>
<script>
    alert("Items added Successfully");
</script>
<!-- <div class="text-success">
<h4>Registration Successful</h4></div> -->
<%}else if("invalid".equals(str)){ %>
<script>
    alert("Error occurred, please retry!!");
</script>
<%} %>
    <main>
        <div class="container py-4">
            <header class="pb-3 mb-4 border-bottom">
              <a href="#" class="d-flex align-items-center text-dark text-decoration-none">
                
                <span class="fs-4">Administration</span>
              </a>
            </header>
        
            <div class="p-5 mb-4 bg-light rounded-2">
              <div class="container-fluid py-5">
                <h1 class="display-8 fw-bold">Add Items</h1>
                <p class="col-md-10 fs-14">To add new product to display in the home page of the app.</p>
                <a href="additems.jsp" class="btn btn-primary btn-lg" type="button">Click Here</a>
              </div>
            </div>
            <div class="p-5 mb-4 bg-light rounded-2">
                <div class="container-fluid py-5">
                  <h1 class="display-8 fw-bold">Delete Items</h1>
                  <p class="col-md-10 fs-14">To delete unavailable or out of stock items from database.</p>
                  <a href="deleteitem.jsp" class="btn btn-primary btn-lg" type="button">Click Here</a>
                </div>
              </div>
              <div class="p-5 mb-4 bg-light rounded-2">
                <div class="container-fluid py-5">
                  <h1 class="display-8 fw-bold">Manage Order and Delivery of product</h1>
                  <p class="col-md-10 fs-14">To check new orders and see the delivery status.</p>
                  <a href="manageorder.jsp" class="btn btn-primary btn-lg" type="button">Click Here</a>
                </div>
              </div>
              
    </main>
      
      
    
</body>
</html>