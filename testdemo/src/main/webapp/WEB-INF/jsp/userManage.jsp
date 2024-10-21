
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
        <h2>User ${userEntry.username}</h2><br/>
        <table>
            <tr>
                <th>Username</th><th>Password</th><th>Full Name</th><th>Email Address</th><th>Delivery Address</th><th>Roles</th>
            </tr>
            <tr>
                <td>${userEntry.username}</td>
                <td>${fn:substringAfter(userEntry.password, '{noop}')}</td>
                <td>${userEntry.full_name}</td>
                <td>${userEntry.email}</td>
                <td>${userEntry.address}</td>
                <td>${userEntry.user_Role}</td>
                <td>
                    <c:forEach items="${userEntry.roles}" var="role" varStatus="status">
                        <c:if test="${!status.first}">, </c:if>
                        ${role.role}
                    </c:forEach>
                </td>
            </tr>
        </table>
    </c:otherwise>
</c:choose>
[<a href="<c:url value="/admin/deleteUser/${userEntry.username}" />">Delete This User</a>]
[<a href="<c:url value="/admin/editUser/${userEntry.username}" />">Edit User Info</a>]
</body>
</html>
