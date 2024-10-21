<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    window.addEventListener("scroll", function(){
        var header = document.querySelector("header");
        header.classList.toggle("sticky", window.scrollY > 0);

    })

    document.querySelector('.like-button').addEventListener('click', (e) => {
        e.currentTarget.classList.toggle('liked');
    });
</script>
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
<h2>${hotel.name}</h2>
    <br/>
    <ul class = "HotelCover">
        <li>Hotel Room Sample:<br/>
            <img alt="img" width="200" height="225" src="${hotel.getPhoto()}"/></li>
    </ul>
    <ul class="HotelDetails">
        <li>Address:${hotel.address}</li><br/>
        <li>Hotel price (per day):${hotel.price}</li><br/>
        <li>Hotel Room Type:${hotel.room_type}</li><br/>
        <li>Hotel Description: ${hotel.description}</li>
    </ul>
    <br/><br/>
    <security:authorize access = "hasRole('USER') or hasRole('ADMIN')">
        <c:url var="addBooking" value="/confirmBooking/${hotel.name}"/>
        <form action="${addBooking}" method="get">
            <input type="submit" class="addBooking" value="Book now" />
        </form>
        &nbsp&nbsp
    </security:authorize>
    <security:authorize access="hasRole('USER')">
        <c:url var="addFav" value="/addToFav/${hotel.name}"/>
        <form action="${addFav}" method="get">
            <input type="submit" class="addToFav" value="add to favourite">
        </form>
    </security:authorize>
    <br/>
    <security:authorize access = "hasRole('ADMIN')">
    [<a href="<c:url value="/admin/editHotel/${hotel.name}"/>">Update this Hotel </a>]
    [<a href="<c:url value="/admin/deleteHotel/${hotel.name}"/>">Delete this Hotel </a>]
    </security:authorize>
    <br/><br/>
<h2>Comment: </h2>
    <c:choose>
        <c:when test="${fn:length(hotelComments) == 0}">
        <h2> This hotel doesn't have any comments yet </h2>
        </c:when>
        <c:otherwise>
            <table style="width:25%">
                <tr>
                    <th> Username </th>
                    <th> Comment </th>
                    <th> Date </th>
                </tr>
            <c:forEach items="${hotelComments}" var="hotelComment">
                    <tr>
                        <td>${hotelComment.username}</td>
                        <td>${hotelComment.comment}</td>
                        <td>${hotelComment.date}</td>
                        <security:authorize access="hasRole('AMDIN')">
                        <td>
                            <a href="<c:url value="/admin/deleteComment/${hotelComment.id}"/>">
                                Delete Comment
                            </a>
                        </td>
                        </security:authorize>
                    </tr>
            </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
    <security:authorize access="hasRole('USER') or hasRole('ADMIN')">
        <form:form modelAttribute="commentForm" method="POST" >
            <form:label path="comment">
                <form:textarea path="comment" rows="5" cols="50"/>
            </form:label><br/>
            <input type="submit" class = "addComment" value="Add Comment" />
        </form:form>
    </security:authorize>
</body>
</html>