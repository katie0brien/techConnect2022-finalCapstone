<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 8/23/2022
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url var="landmarkList" value="/landmark/list/${itineraryId}/${personName}"/>
<div class="homeButton">
    <form method="get" action="${landmarkList}">
        <%--        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>--%>
        <input type="image" src="${home}" style="max-width: 100%;"  alt="Submit" />
    </form>
</div>
<ul>
    <c:forEach items="${landmarks}" var="landmark">
        <li><c:out value="${landmark.name}"/></li>
    </c:forEach>
</ul>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />
