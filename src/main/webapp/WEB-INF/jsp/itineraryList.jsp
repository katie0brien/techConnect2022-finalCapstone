<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<%@page import="com.techelevator.io.csvFileWriter"%>

<form action="/itinerary/delete" method="POST">
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

                        <td><a href="/itinerary/edit/${itinerary.irineraryId}">Edit</a></td>
                        <td><a href="/landmark/itinerary/${itinerary.irineraryId}">View Landmarks</a></td>
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}/1"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                            <input type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form></td>
                        <td><a href="/itinerary/edit/download/${itinerary.irineraryId}">Download your Itinerary (.csv)</a></td>
                        <td><a href="https://labs.mapbox.com/community/nonprofit-route-tool/#/authoring" target="_blank">Route your Trip</a></td>

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
                        <td><a href="/landmark/itinerary/${itinerary.irineraryId}">View Landmarks</a></td>
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}/1"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                            <input type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form></td>
                        <td><a href="/itinerary/edit/download/${itinerary.irineraryId}">Download your Itinerary (.csv)</a></td>
                        <td><a href="https://labs.mapbox.com/community/nonprofit-route-tool/#/authoring" target="_blank">Route your Trip</a></td>
                    </tr>
                </c:if>


            </c:forEach>
        </table>

        <p><a href="/itinerary/create/1">add itinerary</a></p>

</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />