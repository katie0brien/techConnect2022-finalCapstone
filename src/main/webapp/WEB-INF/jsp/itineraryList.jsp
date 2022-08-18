<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<table>
    <h1>Upcoming Trips</h1>
    <tr>
        <th>Trip Name</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>

    <c:forEach items="${itineraries}" var="itinerary">
        <c:if test="${!itinerary.past}">

            <tr>
                <td>
                    <c:out value="${itinerary.name}"></c:out>

                </td>
                <td>
                    <c:out value="${itinerary.fromDate}"></c:out>
                </td>
                <td>
                    <c:out value="${itinerary.toDate}"></c:out>
                </td>
                <td><a href="#">Delete</a></td>
                <td><a href="#">Edit</a></td>

            </tr>

        </c:if>


    </c:forEach>
</table>
<table>
    <h1>Past Trips</h1>
    <tr>
        <th>Trip Name</th>
        <th>Start Date</th>
        <th>End Date</th>
    </tr>

    <c:forEach items="${itineraries}" var="itinerary">
        <c:if test="${itinerary.past}">

            <tr>
                <td>
                    <c:out value="${itinerary.name}"></c:out>

                </td>
                <td>
                    <c:out value="${itinerary.fromDate}"></c:out>
                </td>
                <td>
                    <c:out value="${itinerary.toDate}"></c:out>
                </td>

                <td><a href="/itinerary/delete/${itinerary.irineraryId}">Delete</a></td>
                <td><a href="#">Edit</a></td>

            </tr>

        </c:if>


    </c:forEach>
</table>

<p><a href="/itinerary/create/1">add itinerary</a></p>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />