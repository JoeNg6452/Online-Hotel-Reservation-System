<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        window.addEventListener("scroll", function(){
            var header = document.querySelector("header");
            header.classList.toggle("sticky", window.scrollY > 0);

        })

        document.querySelector('.like-button').addEventListener('click', (e) => {
            e.currentTarget.classList.toggle('liked');
        });
    </script>
    <style><%@include file="static/style.css"%></style>
    <title>Hotel List</title>
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
<security:authorize access="hasRole('USER')">
    <h2>Welcome ${user}!</h2>
</security:authorize>
<h2>Hotel List</h2>
<security:authorize access="hasRole('ADMIN')">
    <a href="<c:url value="/admin/addHotel" />">Add New Hotel</a>
</security:authorize>
<br/><br/>
<c:choose>
    <c:when test="${fn:length(hotels) == 0}">
        <i>There are no hotel in the system.</i>
    </c:when>
    <c:otherwise>
        <table style="width:100%" class="indexTable">
            <c:forEach items="${hotels}" var="entry">
                <tr>
                    <td class="indexTD">
                    <a href="<c:url value="/hotelInfo/${entry.name}" />">
                        <img alt="img" width="200" height="225" src="${entry.getPhoto()}"/></a>
                    <br/>
                    <a style="font-size: 30px" href="<c:url value="/hotelInfo/${entry.name}" />">
                        <c:out value="${entry.name}"/></a>
                    <security:authorize access="hasRole('USER')">
                        <c:url var="myFavouritetUrl" value="/store/myFavourite"/>
                    </security:authorize>
                    <security:authorize access="hasRole('ADMIN')">
                        [<a href="<c:url value="/admin/deleteHotel/${entry.name}" />">Delete</a>]
                    </security:authorize>
                    <br/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

</body>
</html>
