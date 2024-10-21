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
    <title>User's Bookings</title>
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
<br/><br/><br/>
<h2>${user}'s Bookings</h2><br/>
    <c:choose>
        <c:when test="${fn:length(bookings)==0}">
            <h2>You don't have any booking yet</h2>
        </c:when>
        <c:otherwise>
            <table class = "border_table" style="width: 70%">
                <tr>
                    <th>Booking ID</th>
                    <th>Hotel Name</th>
                    <th>Date</th>
                    <th>Room Type</th>
                    <th>Price</th>
                </tr>
                <c:forEach items="${bookings}" var="booking">
                    <tr>
                        <td>
                                ${booking.id}
                        </td>
                        <td>
                            <a href="<c:url value="/hotelInfo/${booking.hotelname}" />">
                            <c:out value="${booking.hotelname}"/></a>
                        </td>
                        <td>
                                ${booking.date}
                        </td>
                        <td>
                                ${booking.room_type}
                        </td>
                        <td>
                                ${booking.price}
                        </td>
                        <td>
                                <a href="<c:url value="/self/deleteBooking/${booking.id}"/>">
                                    Delete Booking
                                </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>

