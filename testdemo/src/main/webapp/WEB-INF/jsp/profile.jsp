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
    <title>User's Profile</title>
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
<table>
    <c:choose>
        <c:when test="${userInfo == null}">
            <i>There are no such user.</i>
        </c:when>
        <c:otherwise>
            Username:<br/>${userInfo.username}<br/><br/>
            Password:<br/>${userInfo.password}<br/><br/>
            Full Name:<br/>${userInfo.full_name}<br/><br/>
            Email Address:<br/>${userInfo.email}<br/><br/>
            Delivery Address:<br/>${userInfo.address}<br/><br/>
        </c:otherwise>
    </c:choose>
</table>
<security:authorize access="hasRole('USER')">
    [<a href="<c:url value="/self/profile/update" />">Update My Info</a>]
</security:authorize>
<security:authorize access="hasRole('USER')">
    [<a href="<c:url value="/self/deleteAc" />">Delete My Account</a>]
</security:authorize>
</body>
</html>
