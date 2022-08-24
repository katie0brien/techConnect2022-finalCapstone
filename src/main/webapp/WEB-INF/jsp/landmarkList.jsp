<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<table>
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>State or Region</th>
        <th>city</th>
        <th>Zip or Postal</th>
        <th>Country</th>
    </tr>
    <c:forEach items="${landmarks}" var="landmark">
            <tr>
                <td>
                    <c:url var="landmarkDetailsPageUrl" value="/landmark/details/${landmark.id}"></c:url>
                    <a href="${landmarkDetailsPageUrl}"><c:out value="${landmark.name}"></c:out></a>

                </td>
                <td>
                    <c:out value="${landmark.streetAddress}"></c:out>
                </td>
                <td>
                    <c:out value="${landmark.stateOrRegion}"></c:out>
                </td>
                <td>
                    <c:out value="${landmark.city}"></c:out>
                </td>
                <td>
                    <c:out value="${landmark.zipOrPostal}"></c:out>
                </td>
                <td>
                    <c:out value="${landmark.country}"></c:out>
                </td>

                    <%--            <td><form method="POST" action="/landmark/review/${landmark.id}/${"True"}"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>--%>
                    <%--                <input type="submit" value="Like"/></form>--%>
                    <%--            </td>--%>

                    <%--            <td><form method="POST" action="/landmark/review/${landmark.id}/${"False"}"><input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>--%>
                    <%--                <input type="submit" value="Dislike"/></form>--%>
                    <%--            </td>--%>

                <td>
                    <form method="POST" action="/review/new/${landmark.id}/${landmark.liked}/${itineraryId}">
                        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                        <input type="submit" id="likeButton" value="${landmark.liked ? "Remove From Favorites" : "Add to Favorites"}" onclick="Buttontoggle()">
                    </form>
                </td>
            </tr>
    </c:forEach>
</table>


    <h2>Favorites</h2>
<ul>
    <c:forEach items="${landmarks}" var="landmark">
        <c:if test="${landmark.liked}">
            <li><c:out value="${landmark.name}"/></li>
        </c:if>
    </c:forEach>
</ul>



<script type="text/javascript">
    function Buttontoggle()
    {
        var t = document.getElementById("likeButton");
        if(t.value=="Dislike"){
            t.value="Like";}
        else if(t.value=="Like"){
            t.value="Dislike";}
    }
</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />