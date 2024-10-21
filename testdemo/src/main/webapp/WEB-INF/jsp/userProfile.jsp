<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        window.addEventListener("scroll", function(){
            var header = document.querySelector("header");
            header.classList.toggle("sticky", window.scrollY > 0);

        })
        function edit(){
            document.getElementById('password').removeAttribute('disabled');
            document.getElementById('fullName').removeAttribute('disabled');
            document.getElementById('email').removeAttribute('disabled');
            document.getElementById('delivery address').removeAttribute('disabled');
            document.getElementById('phone').removeAttribute('disabled');
        }
    </script>
    <style><%@include file="static/style.css"%></style>
    <title>Order History</title>
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
<h2>${userInfo.username}'s Profile</h2>
<br/><br/>
<form:form method="POST" modelAttribute="userUpdateForm">
    <form:label path="username">Username:</form:label><br/>
    <form:input type="text" path="username" value="${userInfo.username}" disabled="true"/><br/><br/>
    <form:label path="password">Password:</form:label><br/>
    <form:input type="text" path="password" value="${userInfo.password}"/><br/><br/>
    <form:label path="full_name">Full Name:</form:label><br/>
    <form:input type="text" path="full_name" value="${userInfo.full_name}"/><br/><br/>
    <form:label path="email">Email Address:</form:label><br/>
    <form:input type="text" path="email" value="${userInfo.email}"/><br/><br/>
    <form:label path="address">Delivery Address:</form:label><br/>
    <form:input type="text" path="address" value="${userInfo.address}"/>
    <br/><br/>
    <input type="submit" value="Confirm Update"/>
</form:form>
</body>
</html>
