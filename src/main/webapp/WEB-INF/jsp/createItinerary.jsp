<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%--<c:url var="validationJs" value="/js/user-validation.js" />--%>
<%--<script src="${validationJs}"></script>--%>

<c:url var="formAction" value="/itinerary/create/1" />
<form method="POST" action="${formAction}">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="tripName">Trip Name: </label>
                <input type="text" id="tripName" name="tripName" placeHolder="Trip Name" class="form-control" />
<%--                <label id="userNameAvailableError" class="error">This user name is taken</label>--%>
            </div>

            <div class="form-group">
                <label for="fromDate">Start Date: </label>
                <input type="Date" id="fromDate" name="fromDate" placeHolder="Start Date" class="form-control" />
            </div>
            <div class="form-group">
                <label for="toDate">End Date: </label>
                <input type="Date" id="toDate" name="toDate" placeHolder="End Date" class="form-control" />
            </div>
            <button type="submit" id="" class="btn btn-primary">Create Itinerary</button>
        </div>
        <div class="col-sm-4"></div>
    </div>
</form>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />