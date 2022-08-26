<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/list.jsp" />
<c:url var="hot1" value="../../img/hotB.png" />
<c:url var="hot2" value="../../img/hot2.png" />
<c:url var="hot3" value="../../img/hot3.png" />
<c:url var="hot4" value="../../img/hot4.png" />
<c:url var="blimp" value="../../img/blimp.png" />



<div class="left">
<div class="top">
    <div class="buttonBox">
    <c:url var="itineraryList" value="/itinerary/list/${userName}" />
    <form method="get" action="${itineraryList}">
        <input class="backButton" type="submit" value="Back" />
    </form>
        <form method="GET" action="/login">
            <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
            <input class="delete" type="submit" value="logout" onclick = "return confirm('End Session?');" />
        </form>
</div>
    <div class="company"> trip planner</div>
    <div class="holder"></div>

</div>
    <div class="title">

        <div class="trip">An Awesome Trip</div>
        <div class="by">by</div>
        <div class="name">${userName}</div>

    </div>
    <div class="hiddenBottom"></div>



</div>

<div class="right">
<br/>
    <h1>Landmarks Visited</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Address</th>
            <th>State or Region</th>
            <th>City</th>
            <th>Country</th>
            <th>Liked</th>
        </tr>
        <c:forEach items="${landmarks}" var="landmark">
            <tr>
                <td>
                    <c:url var="landmarkDetailsPageUrl" value="/landmark/details/${landmark.id}/${itineraryId}/${userName}"></c:url>
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
                    <c:out value="${landmark.country}"></c:out>
                </td>
                <td>
                    <form method="POST" action="/review/new/${landmark.id}/${landmark.liked}/${itineraryId}/${userName}">
                        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                        <input type="submit" id="likeButton" value="${landmark.liked ? "Remove From Favorites" : "Add to Favorites"}" onclick="Buttontoggle()">
                    </form>
                </td>
            </tr>

        </c:forEach>
    </table>

   <div class="break"></div>
    <h1>Favorites From This Itinerary</h1>
<ul>
    <c:forEach items="${landmarks}" var="landmark">
        <c:if test="${landmark.liked}">
            <li><c:out value="${landmark.name}"/></li>
        </c:if>
    </c:forEach>
</ul>

<p class="fav"><a href="/landmark/favorites/${userName}/${itineraryId}">View Favorites</a></p>
</div>

<div class="hotB">
    <div class="hot1">   <img id="ranPic" src="${hot1}" alt="">   </div>
    <div class="hot2">   <img id="ranPic2" src="${blimp}g" alt="">   </div>


</div>


<script type="text/javascript">
    function Buttontoggle()
    {
        var t = document.getElementById("likeButton");
        if(t.value=="Dislike"){
            t.value="Like";}
        else if(t.value=="Like"){
            t.value="Dislike";}
    }

    var picRan = ["${hot1}", "${hot2}", "${hot3}", "${hot4}", "${blimp}"];
    var randomNum = Math.floor(Math.random()*picRan.length);
    document.getElementById("ranPic").src=picRan[randomNum];

    var picRan2 =  ["${hot1}", "${hot2}", "${hot3}", "${hot4}", "${blimp}"];
    var randomNum = Math.floor(Math.random()*picRan2.length);
    document.getElementById("ranPic2").src=picRan2[randomNum];

</script>

