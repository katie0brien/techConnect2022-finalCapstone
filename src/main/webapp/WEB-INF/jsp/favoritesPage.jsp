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
<ul>
    <c:forEach items="${landmarks}" var="landmark">
        <li><c:out value="${landmark.name}"/></li>
    </c:forEach>
</ul>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />
