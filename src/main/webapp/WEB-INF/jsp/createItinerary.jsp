<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/create.jsp" />
<c:url var="hat" value="../../img/cowboy-hat.png" />
<c:url var="plane" value="../../img/airplane.png" />
<c:url var="van" value="../../img/van.png" />
<c:url var="hot" value="../../img/hotB.png" />


<div class="top">
    <div class="girl">  </div>
    <div class="company">trip planner</div>
    <div class="profile"> <img src="${hat}" alt="">  </div>
</div>
<div class="left">
    <form:form class="theForm" method="POST" action="${formAction}" modelAttribute="itinerary">
        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
        <div class="row">


            <div class="form-group">
                <label for="name">Trip Name: </label>
                <input type="text" id="name" name="name" placeHolder="Trip Name" class="form-control" />
            </div>
            <div class="form-group">
                <label for="fromDate">Start Date: </label>
                <input type="Date" id="fromDate" name="fromDate" placeHolder="Start Date" class="form-control" />
            </div>
            <div class="form-group">
                <label for="toDate">End Date: </label>
                <input type="Date" id="toDate" name="toDate" placeHolder="End Date" class="form-control" />
            </div>

            <div class="buttonBox">
                <button type="submit" id="" class="submitButton">create</button></div>
        </div>


    </form:form>
</div>

<div class="right">

    <div class="title"> <p>where to?</p> </div>
    <div class="mapBox">
        <%--        THE MAP GOES IN HERE--%>

        <div id="map"></div>
    </div>

</div>


<div class="planeContainer"> <img class="plane" src="${plane}" alt="">  </div>

<div class="vanContainer"> <img class="van" src="${van}" alt=""> </div>
<div class="hotContainer"> <img class="hot" src="${hot}" alt=""> </div>



