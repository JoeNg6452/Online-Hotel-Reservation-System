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
    <title>Comment History</title>
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
<h2>${user}'s Comment History</h2>
<br/>
<c:choose>
    <c:when test="${fn:length(comments)==0}">
        <h2>You don't have any comments yet</h2>
    </c:when>
    <c:otherwise>
        <table class = "border_table" style="width: 70%">
            <tr>
                <th>Comment ID</th>
                <th>Username</th>
                <th>Hotel Name</th>
                <th>Comment</th>
                <th>Date</th>
            </tr>
            <c:forEach items="${comments}" var="comment">
                <tr>
                    <td>
                            ${comment.id}
                    </td>
                    <td>
                            ${comment.username}
                    </td>
                    <td>
                        <a href="<c:url value="/hotelInfo/${comment.hotelname}" />">
                            <c:out value="${comment.hotelname}"/></a>
                    </td>
                    <td>
                            ${comment.comment}
                    </td>
                    <td>
                            ${comment.date}
                    </td>
                    <td>
                        <a href="<c:url value="/self/deleteComment/${comment.id}"/>">
                                <c:out value="Delete Comment"/>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
</body>
</html>
