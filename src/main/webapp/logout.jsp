<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>

<%
    // Invalidate the session
    
 
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("email")) {
            cookie.setMaxAge(0); // Delete cookie
            response.addCookie(cookie);
            break;
        }
    }

    // Redirect to the login page
    response.sendRedirect("index.jsp");
%>