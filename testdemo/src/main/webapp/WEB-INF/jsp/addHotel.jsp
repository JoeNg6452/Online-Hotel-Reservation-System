<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<h2>Add A Hotel</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="form">
    <form:label path="name">Hotel Name:</form:label><br/>
    <form:input type="text" path="name"/><br/><br/>
    <form:label path="address">Hotel Address:</form:label><br/>
    <form:input type="text" path="address"/><br/><br/>
    <form:label path="description">Hotel Description:</form:label><br/>
    <form:textarea path="description" rows="5" cols="30"/><br/><br/>
    <form:label path="price">Hotel Price:</form:label><br/>
    <form:input type="text" path="price"/><br/><br/>
    <form:label path="room_type">Hotel Room Type:</form:label><br/>
    <form:input type="text" path="room_type"/><br/><br/>
    <form:label path="availability">Hotel Availability:</form:label><br/>
    <form:checkbox path="availability" value="true"/>True
    <form:checkbox path="availability" value="false"/>False<br/>
    <form:label path="file">Hotel Photo:</form:label>
    <input type="file" name="file"/>
    <br/><br/>
    <br/><br/>
    <input type="submit" value="Add Book"/>
</form:form>
</body>
</html>