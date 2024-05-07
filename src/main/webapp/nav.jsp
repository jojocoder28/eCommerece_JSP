<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.ecommerce.model.dao.*" %>


<%
	Cookie[] cookies = request.getCookies();
   	String values=null, email = null,name=null, uid=null,cart=null;
   	String newname=null;
    for (Cookie cookie : cookies) {
       if (cookie.getName().equals("email")) {
            values = cookie.getValue();
            String[] newvalues = values.split("__");
            //System.out.println(newvalues[0]);
            email=newvalues[0];
            name=newvalues[1];
            uid=newvalues[2];
            cart=newvalues[3];
            name=name.replace("_"," ");
            
            if(name.length()<7){
            	newname=name;
            }
            else{newname=name.substring(0,7);}
         	break;
        }
    }
    UserDao ud=new UserDao();
    ResultSet rs1=ud.info(email);
    while(rs1.next()){
    	cart=rs1.getString(5);
    }
    
    %>
    
    
    
<nav class="nav bg-blue">
        <a href="index.jsp" class="navbox">
            <img src="./logo dark.png" alt="" width="150" height="50" class="img-fluid">
        </a>
        <a href="#" class="navbox">
            <div class="address">
                <span class="location-img">
                    <svg class="white" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                </span>
                <span class="address-word">
                    <span style="color: rgba(255, 255, 255, 0.621)"> Home </span>
                    <p id="dark-theme" class="navtext">Select your address</p>
                </span>
            </div>
        </a>
        <div class="searchbar">
            <form class="compact">
                <span class="dropdown">
                    <button class="btn btn-light srch dropdown-toggle" type="button" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      All
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">All categories</a>
                      <a class="dropdown-item" href="#">Accesories</a>
                      <a class="dropdown-item" href="#">Electronics</a>
                    </div>
                </span>
                <input class="searchbox" type="text" placeholder="Search amazing.in">
                <button class="btn yellow">
                    <svg class="black" xmlns="http://www.w3.org/2000/svg" height="1.4em" viewBox="0 0 512 512"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                </button>           
            </form>
        </div>
        <span class="dropdown navbox">
            <a class="white" style="text-decoration: none;" class="dropdown-toggle" type="button" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <img src="https://img.icons8.com/?size=512&id=32584&format=png" height="25px" width="27px">
              <span class="lang">EN</span>
              <span><svg class="white" xmlns="http://www.w3.org/2000/svg" height=".7em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg></span>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="#">English</a>
              <a class="dropdown-item" href="#">Bengali</a>
              <a class="dropdown-item" href="#">Hindi</a>
            </div>
        </span>
        <span class="dropdown navbox">
            <a style="text-decoration: none;" class="white" class="dropdown-toggle" type="button" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <% if (email == null) {%>
              <span class="rel">Hello, sign in</span>
              <span class="lang">Account & list</span>
              <span><svg class="white" xmlns="http://www.w3.org/2000/svg" height=".7em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg></span>
            </a>
            <div class="dropdown-menu log-drop" >
              <a href="login.jsp" class="dropdown-item signin">Sign in</a>
              <p class="signup">New customer?<a href="register.jsp">Register</a></p>
            </div>
            <% }else{ %>
            <span class="rel">Hello, <%= newname %>...</span>
              <span class="lang">Account & list</span>
              <span><svg class="white" xmlns="http://www.w3.org/2000/svg" height=".7em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg></span>
            </a>
            <div class="dropdown-menu log-drop" >
            	<div class="details">Email: <%= email %></div>
            	<div class="details">Name: <%= name %></div>
            	<div class="details">Username: <%= uid %></div>
              <a class="dropdown-item signina lend" href="logout.jsp">Log Out</a>
            </div>
            <%} %>
        </span>
        <a href="#" class="navbox">
            
                <span class="return">
                    <span style="color: rgba(255, 255, 255, 0.621)"> Returns</span>
                    <p class="lang">& Orders</p>
                </span>
            
        </a>
        <a href="cart.jsp" class="navbox">
                <div class="num">
                   <%if(cart==null){ %>
                0
                <%}else{ %>
                    <%=cart %>
                    <%} %>
                </div>
                <span>
                    <svg class="white a-cart" xmlns="http://www.w3.org/2000/svg" height="1.6em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
                </span>
                <span>
                    <span style="color: white;">&nbsp;Cart </span>
                </span>
        </a>

    </nav>
    <div id="start" class="temp">

    </div>
    
    