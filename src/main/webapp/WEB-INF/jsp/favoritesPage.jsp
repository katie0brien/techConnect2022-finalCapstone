<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 8/23/2022
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="fovoritesCss" value="/css/favoritesPage.css"/>

<link rel="stylesheet" type="text/css" href="${favoritesCss}"/>

<c:import url="/WEB-INF/jsp/common/favorite.jsp" />
<c:url var="landmarkList" value="/landmark/list/${itineraryId}/${personName}"/>



<div class="top">
    <div class="profile">
        <c:url var="landmarkList" value="/landmark/list/${itineraryId}/${userName}" />
        <form method="get" action="${landmarkList}">
            <button type="submit" class="backButton">back</button>
        </form>

    </div>

    <div class="company">trip planner</div>
    <div class="girl"><img src="${hot}" alt="">   </div>
</div>
<div class="left">
    <h1>Favorites</h1>
<ul>
    <c:forEach items="${landmarks}" var="landmark">
        <li><c:out value="${landmark.name}"/></li>
    </c:forEach>
</ul>
</div>

<div class="right">
    <img src="" alt="">
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />
