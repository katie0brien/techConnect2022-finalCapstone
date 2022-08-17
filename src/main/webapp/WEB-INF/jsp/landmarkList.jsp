<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<table>
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>State or Region</th>
        <th>city</th>
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
<%--            <td>--%>
<%--                <c:out value="${landmark.zipOrPostal}"></c:out>--%>
<%--            </td>--%>
            <td>
                <c:out value="${landmark.country}"></c:out>
            </td>
        </tr>

    </c:forEach>
</table>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />