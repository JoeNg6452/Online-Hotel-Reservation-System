<%--
  Created by IntelliJ IDEA.
  User: thoma
  Date: 14/4/2024
  Time: 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Page</title>
    <style><%@include file="static/style.css"%></style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
<header>
    <div class="logo"><a href="<c:url value="/"/>">Online Hotel Booking</a></div>
    <nav class ="navbar">
        <ul>
            <li>
                <security:authorize access="isAnonymous()">
                    <a href="<c:url value="/registration" />"> Registration</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="isAnonymous()">
                    <a href="<c:url value="/login" />"> Login</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
                    <c:url var="logoutUrl" value="/logout"/>
                    <form action="${logoutUrl}" method="post">
                        <input type="submit" class="logout" value="Log out" />
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('ADMIN')">
                    <a href="<c:url value="/admin/listUsers" />">Manage User Accounts</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('USER')">
                    <a href="<c:url value="/self/myBookings" />">My Bookings</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('ADMIN')">
                    <a href="<c:url value="/admin/allBookings" />">All Bookings</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('USER')">
                    <a href="<c:url value="/self/comhist" />">My Comment History</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('ADMIN')">
                    <a href="<c:url value="/admin/allComments"/>">Manage Comments</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('USER')">
                    <a href="<c:url value="/self/favHotels"/>">My Favourite</a>
                </security:authorize>
            </li>
            <li>
                <security:authorize access="hasRole('USER')">
                    <a href="<c:url value="/self/profile"/>">My Profile</a>
                </security:authorize>
            </li>
        </ul>
    </nav>
</header>
<br/>
<br/>

<c:choose>
    <c:when test="${userEntry == null}">
        <i>There is no such user.</i>
    </c:when>
    <c:otherwise>
        <h2>User ${userEntry.username}:</h2><br/>
        <form:form method="POST" modelAttribute="userForm">
            <form:input type="hidden" path="username" value="${userEntry.username}" />
            <form:label path="password">Password:</form:label><br/>
            <form:input type="text" path="password" value="${userEntry.password}"/><br/><br/>
            <form:label path="full_name">Full Name:</form:label><br/>
            <form:input type="text" path="full_name" value="${userEntry.full_name}"/><br/><br/>
            <form:label path="email">Email Address:</form:label><br/>
            <form:input type="text" path="email" value="${userEntry.email}"/><br/><br/>
            <form:label path="address">Delivery Address:</form:label><br/>
            <form:input type="text" path="address" value="${userEntry.address}"/><br/><br/>
            <form:label path="user_Role">Role:</form:label><br/>
            <form:checkbox path="user_Role" value="ROLE_USER"/>USER ROLE
            <form:checkbox path="user_Role" value="ROLE_ADMIN"/>ADMIN ROLE
            <br/><br/>
            <input type="submit" value="Confirm Edit"/>
        </form:form>
    </c:otherwise>
</c:choose>
[<a href="<c:url value="/admin/deleteUser/${userEntry.username}" />">Delete This User</a>]
[<a href="<c:url value="/admin/editUser/${userEntry.username}" />">Edit User Info</a>]
</body>
</html>
