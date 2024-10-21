<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <style><%@include file="static/style.css"%></style>
</head>
<body>
<header>
    <div class="logo"><a href="<c:url value="/"/>">Online Hotel Booking</a></div>
    <nav class ="navbar">
        <ul>
            <li>
                <a href="<c:url value="/store" />">Return to Book store</a>
            </li>
            <li>
                <security:authorize access="isAnonymous()">
                    <a href="<c:url value="/login" />"> Login</a>
                </security:authorize>
            </li>
        </ul>
    </nav>
</header>
<br/><br/>
<form:form method="POST" modelAttribute="userReg">
    <form:label path="username">Username:</form:label><br/>
    <form:input type="text" path="username" required="true" /><br/><br/>
    <form:label path="password">Password:</form:label><br/>
    <form:input type="password" path="password" required="true" /><br/><br/>
    <form:label path="full_name">Full Name: </form:label><br/>
    <form:input type="text" path="full_name" required="true"/><br/><br/>
    <form:label path="email">Email Address: </form:label><br/>
    <form:input type="text" path="email" required="true" /><br/><br/>
    <form:label path="address">Delivery Address: </form:label><br/>
    <form:input type="text" path="address" required="true" /><br/><br/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="register"/>
</form:form>
</body>
</html>