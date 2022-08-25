<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="buttonBox">
    <c:url var="landmarkList" value="/landmark/list/${itineraryId}/${userName}" />
    <form method="get" action="${landmarkList}">
        <input class="createButton" type="submit" value="Back" />
    </form>
</div>

<table>
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>State or Region</th>
        <th>city</th>
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
                <form method="POST" action="/landmark/details/edit/${landmark.id}">
                    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                    <label for="travelNotes">Travel Notes: </label>
                    <input type="text" id="travelNotes" name="travelNotes" placeHolder="Travel Notes" class="form-control" />
                    <input type="submit" id="travelNotesSubmit" value="Submit">
                </form>
            </td>
            <td>
                <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4">
                    <c:url var="formAction" value="/upload/${landmark.id}" />
                    <form method="POST" action="${formAction}" enctype="multipart/form-data">
                        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>

                        <div class="form-group">
                            <label for="file">File: </label>
                            <input type="file" name="file" id="file" />
                        </div>

                        <button type="submit" class="btn btn-primary">upload</button>
                    </form>
                </div>
                <div class="col-sm-4"></div>
                </div>
            </td>
        </tr>

</table>
<style>
    .upload {
        width: 200px;
    }
    .upload img {
        max-width: 100%;
    }
</style>

<c:choose>
    <c:when test="${landmark.imageName == null}">
        <div class="upload"><img src="/img/home10.jpg" alt=""></div>
    </c:when>
    <c:otherwise>
        <div class="upload"><img src="/img/uploads/${landmark.id}-image.jpg" alt=""></div>
    </c:otherwise>
</c:choose>




<c:import url="/WEB-INF/jsp/common/footer.jsp" />