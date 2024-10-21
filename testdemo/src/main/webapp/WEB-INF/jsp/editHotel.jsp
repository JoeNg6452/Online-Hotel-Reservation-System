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
    <title>Hotel edit Page</title>
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
    <c:when test="${hotelInfo == null}">
        <i>There is no such hotel.</i>
    </c:when>
    <c:otherwise>
        <h2>Hotel ${hotelInfo.name}:</h2><br/>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="updateHotelForm">
            <form:input type="hidden" path="name" value="${hotelInfo.name}" readonly="true"/>
            <form:label path="address">Address:</form:label><br/>
            <form:input type="text" path="address" value="${hotelInfo.address}"/><br/><br/>
            <form:label path="price">Price:</form:label><br/>
            <form:input type="text" path="price" value="${hotelInfo.price}"/><br/><br/>
            <form:label path="room_type">Room Type:</form:label><br/>
            <form:input type="text" path="room_type" value="${hotelInfo.room_type}"/><br/><br/>
            <form:label path="description">Description:</form:label><br/>
            <form:input type="text" path="description" value="${hotelInfo.description}"/><br/><br/>
            <form:label path="availability">Availability:</form:label><br/>
            <form:checkbox path="availability" value="true"/>True
            <form:checkbox path="availability" value="false"/>False
            <br/>
            <form:label path="file">Hotel Photo:</form:label>
            <input type="file" name="file"/>
            <br/><br/>
            <input type="submit" value="Confirm Edit"/>
        </form:form>
    </c:otherwise>
</c:choose>
</body>
</html>
