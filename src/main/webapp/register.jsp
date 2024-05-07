<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String str=request.getParameter("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@ include file="./icon.jsp" %>
</head>
<body>
<%@ include file="./nav.jsp" %>

<%if("valid".equals(str)){ %>
<script>
    alert("Registration Successful");
</script>
<!-- <div class="text-success">
<h4>Registration Successful</h4></div> -->
<%}else if("invalid".equals(str)){ %>
<script>
    alert("Error occurred, please retry!!");
</script>
<!-- <div class="text-danger">
<h4>Error occurred, please retry!!</h4></div> -->
<%} 
   else if("uexists".equals(str)){ %>
   <script>
    alert("Username already exists");
</script>
<!-- <div class="text-warning"><h4>Username already exists</h4></div> -->
<%} else if("eexists".equals(str)){ %>
<script>
    alert("Email already exists");
</script>
<!-- <div class="text-warning"><h4>Email already exists</h4></div> -->
<%} %>
	<!-- <form action="Register" method="POST">
            <table  class="form">
                
                <tr>
                    <td class="logind">Username</td>
                    <td><input  class="loginbox" type="text" placeholder="username" name="uname" size="40px"></td>
                </tr>
                <tr>
                    <td class="logind">Full name</td>
                    <td><input  class="loginbox" type="text" placeholder="full name" name="fname" size="40px"></td>
                </tr>
                <tr>
                    <td class="logind">eMail ID</td>
                    <td><input  class="loginbox" type="email" placeholder="email" name="email" size="40px"></td>
                </tr>
                <tr>
                    <td class="logind">Password</td>
                    <td><input  class="loginbox" type="password" placeholder="make sure nobody is behind you" name="pswd" size="40px"></td>
                </tr>
                <tr>
                	<th><input type="submit" value="Register"></th><th><input type="reset" value="Clear"></th>
                </tr>
            </table>
            
        </form> -->
        <section class="vh-100">
  <div class="container py-5 h-100">
    <div class="row d-flex align-items-center justify-content-center h-100">
      <div class="col-md-8 col-lg-7 col-xl-6">
        <img src="./registration.jpg"
          class="img-fluid" alt="Phone image">
      </div>
        <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1 login-window endlike" >
        
        <form id="myForm" action="Register" method="post">
        
         <div class="form-outline mb-4">
            <input id="myInput" type="text" id="form1Example13" class="form-control form-control-lg" name="uname"/>
            <label class="form-label" for="form1Example13">Username</label>
            <p id="errorMessage" style="display:none; color:red;">Input cannot be empty</p>
          </div>
           <div class="form-outline mb-4">
            <input id="myInput1" type="text" id="form1Example13" class="form-control form-control-lg" name="fname"/>
            <label class="form-label" for="form1Example13">Full Name</label>
            <p id="errorMessage1" style="display:none; color:red;">Input cannot be empty</p>
          </div>
          <!-- Email input -->
          <div class="form-outline mb-4">
            <input id="myInput2" type="email" id="form1Example13" class="form-control form-control-lg" name="email"/>
            <label class="form-label" for="form1Example13">Email address</label>
            <p id="errorMessage2" style="display:none; color:red;">Input cannot be empty</p>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-4">
            <input id="myInput3" type="password" id="form1Example23" class="form-control form-control-lg" name="pswd"/>
            <label class="form-label" for="form1Example23">Password</label>
            <p id="errorMessage3" style="display:none; color:red;">Input cannot be empty</p>
          </div>

          <div class="d-flex justify-content-around align-items-center mb-4">
            <!-- Checkbox -->
            <!-- <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
              <label class="form-check-label" for="form1Example3"> Remember me </label>
            </div> -->
            <p>Already have an account? <a href="login.jsp">Login</a></p>
          </div>

          <!-- Submit button -->
          <div class="center-btn">
          <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
		  </div>
          

        </form>
        </div>
        </div>
        </div>
        </section>
    <script>
    document.getElementById("myForm").addEventListener("submit", function(event) {
        var inputValue = document.getElementById("myInput").value;
        if (inputValue.trim() === "") {
            // Prevent the form from submitting
            event.preventDefault();
            // Show the error message
            document.getElementById("errorMessage").style.display = "block";
        }
        var inputValue = document.getElementById("myInput1").value;
        if (inputValue.trim() === "") {
            // Prevent the form from submitting
            event.preventDefault();
            // Show the error message
            document.getElementById("errorMessage1").style.display = "block";
        }
        var inputValue = document.getElementById("myInput2").value;
        if (inputValue.trim() === "") {
            // Prevent the form from submitting
            event.preventDefault();
            // Show the error message
            document.getElementById("errorMessage2").style.display = "block";
        }
        var inputValue = document.getElementById("myInput3").value;
        if (inputValue.trim() === "") {
            // Prevent the form from submitting
            event.preventDefault();
            // Show the error message
            document.getElementById("errorMessage3").style.display = "block";
        }
    });
</script>
</body>
</html>