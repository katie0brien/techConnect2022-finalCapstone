<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/list.jsp" />
<c:url var="hot1" value="../../img/hotB.png" />
<c:url var="hot2" value="../../img/hot2.png" />
<c:url var="hot3" value="../../img/hot3.png" />
<c:url var="hot4" value="../../img/hot4.png" />
<c:url var="blimp" value="../../img/blimp.png" />

<div class="left">

    <div class="company"> trip planner</div>
    <div class="title">

        <div class="trip">Egg hunt</div>
        <div class="by">by</div>
        <div class="name">camille camel</div>

    </div>
    <c:url var="adventurer" value="../../img/adventurerDude.png" />
    <div class="logo"> <img src="${adventurer}" alt="">  </div>

</div>

<div class="right">

    <h1>Landmarks Visited</h1>
    <table>
        <tr>
            <th>Name</th>
            <th>Address</th>
            <th>State or Region</th>
            <th>city</th>
            <th>Country</th>
            <th>Liked</th>
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


    <h2>Favorites From This Itinerary</h2>
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

    var picRan = new Array ("${hot1}", "${hot2}", "${hot3}", "${hot4}", "${blimp}");
    var randomNum = Math.floor(Math.random()*picRan.length);
    document.getElementById("ranPic").src=picRan[randomNum];

    var picRan2 =  new Array ("${hot1}", "${hot2}", "${hot3}", "${hot4}", "${blimp}");
    var randomNum = Math.floor(Math.random()*picRan2.length);
    document.getElementById("ranPic2").src=picRan2[randomNum];

</script>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />