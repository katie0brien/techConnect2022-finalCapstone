<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<script type ="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#checkBoxAll').click(function() {
            if ($(this).is(":checked"))
                $('.chkCheckBoxId').prop('checked', true);
            else
                $('.chkCheckBoxId').prop('checked', false);
        })
    })
</script>

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
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}"><input type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form>

                    </tr>

                </c:if>


            </c:forEach>
        </table>
        <table>
            <h1>Past Trips</h1>
            <tr>
                <td><input type="checkbox" id="checkBoxAll"></input></td>
                <th>Trip Name</th>
                <th>Start Date</th>
                <th>End Date</th>
            </tr>

            <c:forEach items="${itineraries}" var="itinerary">
                <c:if test="${itinerary.past}">

                    <tr>
                        <td><input type="checkbox" value="${itinerary.irineraryId}" name="itineraryId"></input></td>
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
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}"><input type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form></td>

                    </tr>
                </c:if>


            </c:forEach>
        </table>

        <p><a href="/itinerary/create/1">add itinerary</a></p>

</form>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />