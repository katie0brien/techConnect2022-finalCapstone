
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/edit.jsp" />
<c:url var="hat" value="../../img/cowboy-hat.png" />


<div class="top">
    <div class="buttonB">
        <c:url var="profilePage" value="/itinerary/list/${userName}" />
        <form method="get" action="${profilePage}">
            <c:url var="van" value="../../img/home.png" />
            <input class="backButton" type="submit" value="Back" />
        </form>

    </div>
    <div class="company">trip planner</div>

    <div class="girl">  </div>
</div>

<%--<c:url var="validationJs" value="/js/user-validation.js" />--%>


<c:url var="home" value="../../img/home.png" />
<c:url var="itineraryList" value="/itinerary/list/${userName}" />


<%--<script src="${validationJs}"></script>--%>
<div class="left">

    <c:url var="formAction" value="/itinerary/edit/${itinerary.irineraryId}/${userName}" />
    <form class="theForm" method="POST" action="${formAction}">
        <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
        <div class="row">
            <h1 class="titleTop">Make changes to ${itinerary.name} from ${itinerary.fromDate} to ${itinerary.toDate}?</h1>

            <div class="forms-group">
                <label for="name">Trip Name: </label>
                <input type="text" id="name" name="name" placeHolder="${itinerary.name}" class="forms-control" />
                <%--                <label id="userNameAvailableError" class="error">This user name is taken</label>--%>
            </div>

            <div class="forms-group">
                <label for="fromDate">Start Date: </label>
                <input type="Date" id="fromDate" name="fromDate" placeHolder="Start Date" class="forms-control" />
            </div>
            <div class="forms-group">
                <label for="toDate">End Date: </label>
                <input type="Date" id="toDate" name="toDate" placeHolder="End Date" class="forms-control" />
            </div>
            <div class="buttonBox">
                <button type="submit" id="" class="submitButton">Save</button></div>
        </div>



    </form>
</div>

<div class="right">

    <div class="title"> <p>where to?</p> </div>
    <div class="mapBox">
        <div id="map"></div>


    </div>

</div>

<div class="vanContainer"> <img class="van" src="${van}" alt=""> </div>

<%-- modal pop up about asking user to save pin />--%>
<div class="modal" tabindex="-1" role="dialog" id="savePinModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Save this pin as a landmark?</h2>
            </div>
            <div class="modal-body">
                <c:url var="formAction" value="/itinerary/create/${userName}" />
                <div>
                    <input type="hidden" id="CSRF_TOKEN" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                    <div class="form-group">
                        <label for="landmarkName">Pin Name: </label>
                        <input type="text" id="landmarkName" name="landmarkName" placeHolder="Pin Name" class="form-control" />
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="saveLandmark()">Save changes</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- the map part of the website />--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Add a geocoder</title>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <link href="https://api.mapbox.com/mapbox-gl-js/v2.9.2/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v2.9.2/mapbox-gl.js"></script>
    <style>

        #map { position: absolute; height: 500px; width: 500px; border-radius:10px;}
    </style>
</head>
<body>
<!-- Load the `mapbox-gl-geocoder` plugin. -->
<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.min.js"></script>
<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.css" type="text/css">



<script>
    mapboxgl.accessToken = 'pk.eyJ1Ijoic29ja3Nyb2NrIiwiYSI6ImNsNno3OTh4YzAxbmIzeHBiM3E5b3dxeTkifQ.dQS6hDACss4VM7ifRg2l7A';
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/socksrock/cl6z7fpw9000i14klmkauspuj',
        center: [${longitude}, ${latitude}],
        zoom: 13
    });

    // Add the control to the map.
    map.addControl(
        new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            mapboxgl: mapboxgl
        })
    );

    map.on('click', (event) => {
        landmark.latitude = event.lngLat.lat;
        landmark.longitude = event.lngLat.lng;

        const popUp = $('#savePinModal');
        popUp.modal('show');
    })

    function addMarker(lng, lat) {
        const marker = new mapboxgl.Marker({
            draggable: true
        })

            .setLngLat([lng,lat])
            .addTo(map);
    }

    let landmark = {
        landmarkName: '',
        latitude: 0,
        longitude: 0
    };

    async function saveLandmark(){

        landmark.landmarkName = $("#landmarkName").val();

        const apiUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/` + landmark.longitude + `,` +landmark.latitude + `.json?access_token=pk.eyJ1Ijoic29ja3Nyb2NrIiwiYSI6ImNsNno3OTh4YzAxbmIzeHBiM3E5b3dxeTkifQ.dQS6hDACss4VM7ifRg2l7A`;


        $.get(apiUrl, (data) => {
            console.log(data.features[0].place_name)
            const address = data.features.filter(feature => feature.id.startsWith('address'))[0];
            const streetAddress = address.address + ' ' + address.text;

            const city =  data.features.filter(feature => feature.id.startsWith('place'))[0].text

            const stateOrRegion =  data.features.filter(feature => feature.id.startsWith('region'))[0].text

            const zipOrPostal = data.features.filter(feature => feature.id.startsWith('postcode'))[0].text

            const country =  data.features.filter(feature => feature.id.startsWith('country'))[0].text

            const body = {
                ...landmark,
                'streetAddress': streetAddress,
                'city': city,
                'stateOrRegion': stateOrRegion,
                'zipOrPostal': zipOrPostal,
                'country': country,
                'CSRF_TOKEN': $("#CSRF_TOKEN").val()
            }

            let url = '/landmark/itinerary/1/landmark/create'///' + landmark.landmarkName + '/' + landmark.longitude + '/' + landmark.latitude;

            $.post(url, body, (data) => {
                $('#savePinModal').modal('hide');
                addMarker(landmark.longitude, landmark.latitude)
            })
        });


    }

    <c:set var="markerUrl" value="/itinerary/${itinerary.irineraryId}/landmarks" />
    map.on('load', () => {
        const url = '${markerUrl}';

        $.get(url, (data) => {
            data.forEach(landmark => {
                addMarker(landmark.longitude, landmark.latitude)
            })
        })
    })

</script>

</body>
</html>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />