<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>

     <h2>User Profiles</h2>
    <table border="1">
        <tr>
            <th>UserID</th>
            <th>Username</th>
            <th>Password</th>
            <th>Role</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
        
        <c:forEach var="user" items="${userD}">
        
        	<c:set var="UserID" value="${user.userID}"/>
        	<c:set var="userName" value="${user.userName}"/>
       	 	<c:set var="password" value="${user.password}"/>
        	<c:set var="role" value="${user.role}"/>
        	<c:set var="email" value="${user.email}"/>
        	<c:set var="phone" value="${user.phone}"/>
            <tr>
                <td>${user.userID}</td>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>${user.role}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
            </tr>
        </c:forEach>
    </table>
    <c:url value="UpdateAdmin.jsp" var="adminEdit">
    	<c:param name="id" value="${UserID}"/>
    	<c:param name="uname" value="${userName}"/>
    	<c:param name="pass" value="${password}"/>
    	<c:param name="role" value="${role}"/>
    	<c:param name="email" value="${email}"/>
    	<c:param name="phone" value="${phone}"/>
    
    </c:url>
    <a href="${adminEdit}">
    <input type=button name=update value="Edit">
    </a>
</body>
</html>
