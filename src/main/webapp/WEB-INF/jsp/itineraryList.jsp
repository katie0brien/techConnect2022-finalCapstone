<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/profile.jsp" />
<%@page import="com.techelevator.io.csvFileWriter"%>

<c:url var="likeJs" value="/js/like-button.js"/>
<c:import url="/WEB-INF/jsp/common/profile.jsp" />

<script type="text/javascript" href="${likeJs}"></script>
<div class="top">
    <div class="company">trip planner</div>
    <div class="spaced">
        <div class="hello">hello</div>
        <c:url var="adventurer" value="../../img/adventurer.png" />
        <div class="logo">  <img src="${adventurer}" alt="">  </div>
        <div class="name">${user.fname}</div>
    </div>
</div>
<div class="main">
    <div class="formHolder">

        <table>
            <h1>Upcoming Trips</h1>
            <tr>
                <th>Trip Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>

            <c:forEach items="${itineraries}" var="itinerary">
                <c:if test="${!itinerary.past}">

                    <tr>
                        <td>
                            <c:out value="${itinerary.name}"/>

                        </td>
                        <td>
                            <c:out value="${itinerary.fromDate}"/>
                        </td>
                        <td>
                            <c:out value="${itinerary.toDate}"/>
                        </td>

                        <td><a href="/itinerary/edit/${itinerary.irineraryId}/${userName}">Edit</a></td>
                        <td><a href="/landmark/list/${itinerary.irineraryId}/${userName}">View Landmarks</a></td>
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}/${userName}"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                            <input class="delete" type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form></td>
                        <td><a href="/itinerary/edit/download/${itinerary.irineraryId}">Download your Itinerary (.csv)</a></td>
                        <td><a href="https://labs.mapbox.com/community/nonprofit-route-tool/#/authoring" target="_blank">
<%--                                ${itineraries.size() < 2 ? "" : "Route Your Trip"}--%>
                            Route your Trip (2+ landmarks required)
                        </a></td>

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
                <th></th>
                <th></th>
                <th></th>
                <th></th>

            </tr>

            <c:forEach items="${itineraries}" var="itinerary">
                <c:if test="${itinerary.past}">

                    <tr>
                        <td>
                            <c:out value="${itinerary.name}"/>

                        </td>
                        <td>
                            <c:out value="${itinerary.fromDate}"/>
                        </td>
                        <td>
                            <c:out value="${itinerary.toDate}"/>
                        </td>
                        <td><a href="/landmark/list/${itinerary.irineraryId}/${userName}">View Landmarks</a></td>
                        <td><form method="POST" action="/itinerary/delete/${itinerary.irineraryId}/${userName}"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                            <input class="delete" type="submit" value="Delete" onclick = "return confirm('Confirm Deletion of ${itinerary.name} from itineraries');" /></form></td>
                        <td><a href="/itinerary/edit/download/${itinerary.irineraryId}">Download your Itinerary (.csv)</a></td>
                        <td><a href="https://labs.mapbox.com/community/nonprofit-route-tool/#/authoring" target="_blank">
<%--                            ${itineraries.size() < 3 ? "" : "Route Your Trip"}--%>
                                Route your Trip (2+ landmarks required)
                        </a></td>
                    </tr>
                </c:if>

            </c:forEach>
        </table>

        <p>
        <form method="POST" action="/itinerary/create/${userName}">
            <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
            <input class="delete" type="submit" value="Add Itinerary"/></form>
<%--            <a href="/itinerary/create/${userName}">add itinerary</a>--%>
        </p>


        <c:url var="home" value="../../img/home.png" />
    </div>
    <c:url var="homePage" value="/home/${userName}" />
    <div class="homeButton">
    <form method="get" action="${homePage}">
        <input type="image" src="${home}" style="max-width: 100%;"  alt="Submit" />

    </form></div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />