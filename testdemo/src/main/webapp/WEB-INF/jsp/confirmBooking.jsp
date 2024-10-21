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
    <title>Book List</title>
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
    <form:form method="POST" modelAttribute="bookingForm">
        <form:label path="hotelname">Hotel Name: </form:label>
        <form:input type="text" path="hotelname" value="${hotelInfo.name}" readonly="true"/><br/>
        Address: ${hotelInfo.address}<br/>
        <form:label path="price"> Price: </form:label>
        <form:input type="text" path="price" value="${hotelInfo.price}" readonly="true"/><br/>
        <form:label path="room_type"> Room Type: </form:label>
        <form:input type="text" path="room_type" value="${hotelInfo.room_type}" readonly="true"/><br/>
        Description: ${hotelInfo.description}<br/>
        <form:label path="date"> Date: </form:label>
        <form:input type="date" path="date"/><br/><br/>
        User's Information:<br/>
        <form:label path="username"> Username: </form:label>
        <form:input type="username" path="username" value="${userInfo.username}" readonly="true"/><br/>
        Full Name: ${userInfo.full_name}<br/><br/>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Confirm booking"/>
    </form:form>
</body>
</html>
