<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/single.jsp" />
<c:url var="hot" value="../../img/hotB.png" />
<c:url var="hat" value="../../img/cowboy-hat.png" />


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
<table>
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>State or Region</th>
        <th>City</th>
        <th>Zip or Postal</th>
        <th>Country</th>
        <th>Travel Notes</th>
        <th>Upload an Image</th>
    </tr>
        <tr>
            <td>
                <c:out value="${landmark.name}"></c:out>
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
            <td>
                <c:out value="${landmark.travelNotes}"></c:out>
                <form method="POST" action="/landmark/details/edit/${landmark.id}/${itineraryId}/${userName}">
                    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                    <label for="travelNotes">Travel Notes: </label>
                    <input type="text" id="travelNotes" name="travelNotes" placeHolder="Travel Notes" class="form-control" />
                    <input type="submit" id="travelNotesSubmit" value="Submit">
                </form>
            </td>
            <td>
                <div class="row">

                <div class="col-sm-4">
                    <c:url var="formAction" value="/upload/${landmark.id}/${itineraryId}/${userName}" />
                    <form method="POST" action="${formAction}" enctype="multipart/form-data">
                        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

                        <div class="form-group">
                            <label for="file">File: </label>
                            <input type="file" name="file" id="file" />
                        </div>

                        <button type="submit" class="btn btn-primary">upload</button>
                    </form>
                </div>

                </div>
            </td>
        </tr>

</table>

</div>


 <div class="right">
<c:choose>
    <c:when test="${landmark.imageName == null}">
        <div class="upload"><img src="/img/home10.jpg" alt=""></div>
    </c:when>
    <c:otherwise>
        <div class="upload"><img src="/img/uploads/${landmark.id}-image.jpg" alt=""></div>
    </c:otherwise>
</c:choose>
</div>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />