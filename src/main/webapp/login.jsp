<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String str=request.getParameter("error"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@ include file="./icon.jsp" %>
</head>
<style>
.divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
</style>
<body>
<%@ include file="./nav.jsp" %>


<!-- <form action="Login" method="post">

            <table  class="form">
                
                <tr>
                    <td class="logind">Email</td>
                    <td><input  class="loginbox" type="text" placeholder="email id" name="email" size="40px"></td>
                </tr>
                <tr>
                    <td class="logind">Password</td>
                    <td><input  class="loginbox" type="password" placeholder="enter password" name="pswd" size="40px"></td>
                </tr>
                <tr>
                	<th><input type="submit" value="Login"></th><th><input type="reset" value="Clear"></th>
                </tr>
            </table>
            
        </form>
    <div class="">
        Don't have an account? <a href="register.jsp">Register</a>
    </div>
    </div> -->
    
    <section class="vh-100">
  <div class="container py-5 h-100">
    <div class="row d-flex align-items-center justify-content-center h-100">
      <div class="col-md-8 col-lg-7 col-xl-6">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
          class="img-fluid" alt="Phone image">
      </div>
      <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1 login-window">
        <form action="Login" method="post">
          <!-- Email input -->
          <div class="form-outline mb-4">
            <input type="email" id="form1Example13" class="form-control form-control-lg" name="email"/>
            <label class="form-label" for="form1Example13">Email address</label>
          </div>

          <!-- Password input -->
          <div class="form-outline mb-4">
            <input type="password" id="form1Example23" class="form-control form-control-lg" name="pswd"/>
            <label class="form-label" for="form1Example23">Password</label>
          </div>
          <%if(str!=null){ %>
			<p style="color:red;">Invalid email or password</p>
			<%} %>
          <div class="d-flex justify-content-around align-items-center mb-4">
            <!-- Checkbox -->
            <!-- <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
              <label class="form-check-label" for="form1Example3"> Remember me </label>
            </div> -->
            <p>Dont have an account? <a href="register.jsp">Register</a></p>
          </div>

          <!-- Submit button -->
          <div class="center-btn">
          <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
		  </div>
          

        </form>
      </div>
    </div>
  </div>
</section>
</body>
</html>