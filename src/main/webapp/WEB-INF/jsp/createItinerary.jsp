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



<%--&lt;%&ndash; modal pop up about asking user to save pin />&ndash;%&gt;--%>
<%--<div class="modal" tabindex="-1" role="dialog" id="savePinModal">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h2 class="modal-title">Save this pin as a landmark?</h2>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <c:url var="formAction" value="/itinerary/create/1" />--%>
<%--                <div>--%>
<%--                    <input type="hidden" id="CSRF_TOKEN" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="landmarkName">Pin Name: </label>--%>
<%--                        <input type="text" id="landmarkName" name="landmarkName" placeHolder="Pin Name" class="form-control" />--%>
<%--                        <div class="modal-footer">--%>
<%--                            <button type="button" class="btn btn-primary" onclick="saveLandmark()">Save changes</button>--%>
<%--                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--&lt;%&ndash;RE SPRINT PLANNING 3 MAP WILL ONLY BE DISPLAYED ON EDIT ITINERARY, DELETE COMMENTED OUT CODE LATER&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash; the map part of the website />&ndash;%&gt;&ndash;%&gt;--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="utf-8">--%>
<%--    <title>Add a geocoder</title>--%>
<%--    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">--%>
<%--    <link href="https://api.mapbox.com/mapbox-gl-js/v2.9.2/mapbox-gl.css" rel="stylesheet">--%>
<%--    <script src="https://api.mapbox.com/mapbox-gl-js/v2.9.2/mapbox-gl.js"></script>--%>
<%--    <style>--%>
<%--        body { margin: 0; padding: 0; }--%>
<%--        #map { position: absolute; top: 375px; bottom: 0; width: 50%; }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<!-- Load the `mapbox-gl-geocoder` plugin. -->--%>
<%--<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.min.js"></script>--%>
<%--<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.css" type="text/css">--%>

<%--<div id="map"></div>--%>

<%--<script>--%>
<%--    mapboxgl.accessToken = 'pk.eyJ1Ijoic29ja3Nyb2NrIiwiYSI6ImNsNno3OTh4YzAxbmIzeHBiM3E5b3dxeTkifQ.dQS6hDACss4VM7ifRg2l7A';--%>
<%--    const map = new mapboxgl.Map({--%>
<%--        container: 'map',--%>
<%--        style: 'mapbox://styles/socksrock/cl6z7fpw9000i14klmkauspuj',--%>
<%--        center: [-79.4512, 43.6568],--%>
<%--        zoom: 13--%>
<%--    });--%>

<%--    // Add the control to the map.--%>
<%--    map.addControl(--%>
<%--        new MapboxGeocoder({--%>
<%--            accessToken: mapboxgl.accessToken,--%>
<%--            mapboxgl: mapboxgl--%>
<%--        })--%>
<%--    );--%>

<%--    map.on('click', (event) => {--%>
<%--        landmark.latitude = event.lngLat.lat;--%>
<%--        landmark.longitude = event.lngLat.lng;--%>

<%--        $('#savePinModal').modal('show');--%>
<%--    })--%>

<%--    function addMarker(lng, lat) {--%>
<%--        const marker = new mapboxgl.Marker({--%>
<%--            draggable: true--%>
<%--        })--%>

<%--            .setLngLat([lng,lat])--%>
<%--            .addTo(map);--%>
<%--    }--%>

<%--    let landmark = {--%>
<%--        landmarkName: '',--%>
<%--        latitude: 0,--%>
<%--        longitude: 0--%>
<%--    };--%>

<%--    async function saveLandmark(){--%>

<%--        landmark.landmarkName = $("#landmarkName").val();--%>

<%--        const apiUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/` + landmark.longitude + `,` +landmark.latitude + `.json?access_token=pk.eyJ1Ijoic29ja3Nyb2NrIiwiYSI6ImNsNno3OTh4YzAxbmIzeHBiM3E5b3dxeTkifQ.dQS6hDACss4VM7ifRg2l7A`;--%>


<%--        // // make an api call to mapbox with lat and lng to get the address info--%>
<%--        // const response = await fetch('http://localhost:8080/itinerary/create/pk.eyJ1Ijoic29ja3Nyb2NrIiwiYSI6ImNsNno3OTh4YzAxbmIzeHBiM3E5b3dxeTkifQ.dQS6hDACss4VM7ifRg2l7A');--%>
<%--        // const myJson = await response.json();--%>
<%--        //--%>
<%--        // landmark.latitude = myJson.lngLat.lat;--%>
<%--        // landmark.longitude = myJson.lngLat.lng--%>

<%--        $.get(apiUrl, (data) => {--%>
<%--            console.log(data.features[0].place_name)--%>
<%--            const address = data.features.filter(feature => feature.id.startsWith('address'))[0];--%>
<%--            const streetAddress = address.address + ' ' + address.text;--%>

<%--            const city =  data.features.filter(feature => feature.id.startsWith('place'))[0].text--%>

<%--            const stateOrRegion =  data.features.filter(feature => feature.id.startsWith('region'))[0].text +--%>
<%--                data.features.filter(feature => feature.id.startsWith('postcode'))[0].text--%>

<%--            const country =  data.features.filter(feature => feature.id.startsWith('country'))[0].text--%>

<%--            const body = {--%>
<%--                ...landmark,--%>
<%--                'streetAddress': streetAddress,--%>
<%--                'city': city,--%>
<%--                'stateOrRegion': stateOrRegion,--%>
<%--                'country': country,--%>
<%--                'CSRF_TOKEN': $("#CSRF_TOKEN").val()--%>
<%--            }--%>

<%--            let url = '/landmark/itinerary/1/landmark/create'///' + landmark.landmarkName + '/' + landmark.longitude + '/' + landmark.latitude;--%>

<%--            $.post(url, body, (data) => {--%>
<%--                $('#savePinModal').modal('hide');--%>
<%--                addMarker(landmark.longitude, landmark.latitude)--%>
<%--            })--%>
<%--        });--%>


<%--    }--%>




<%--    //     map.on('load', () => {--%>
<%--    // // Add an image to use as a custom marker--%>
<%--    //         map.loadImage(--%>
<%--    //             'https://docs.mapbox.com/mapbox-gl-js/assets/custom_marker.png',--%>
<%--    //             (error, image) => {--%>
<%--    //                 if (error) throw error;--%>
<%--    //                 map.addImage('custom-marker', image);--%>
<%--    // // Add a GeoJSON source with 2 points--%>
<%--    //                 map.addSource('points', {--%>
<%--    //                     'type': 'geojson',--%>
<%--    //                     'data': {--%>
<%--    //                         'type': 'FeatureCollection',--%>
<%--    //                         'features': [--%>
<%--    //                             {--%>
<%--    // // feature for Mapbox DC--%>
<%--    //                                 'type': 'Feature',--%>
<%--    //                                 'geometry': {--%>
<%--    //                                     'type': 'Point',--%>
<%--    //                                     'coordinates': [--%>
<%--    //                                         -77.03238901390978, 38.913188059745586--%>
<%--    //                                     ]--%>
<%--    //                                 },--%>
<%--    //                                 'properties': {--%>
<%--    //                                     'title': 'Mapbox DC'--%>
<%--    //                                 }--%>
<%--    //                             },--%>
<%--    //                             {--%>
<%--    // // feature for Mapbox SF--%>
<%--    //                                 'type': 'Feature',--%>
<%--    //                                 'geometry': {--%>
<%--    //                                     'type': 'Point',--%>
<%--    //                                     'coordinates': [-122.414, 37.776]--%>
<%--    //                                 },--%>
<%--    //                                 'properties': {--%>
<%--    //                                     'title': 'Mapbox SF'--%>
<%--    //                                 }--%>
<%--    //                             }--%>
<%--    //                         ]--%>
<%--    //                     }--%>
<%--    //                 });--%>
<%--    //--%>
<%--    // // Add a symbol layer--%>
<%--    //                 map.addLayer({--%>
<%--    //                     'id': 'points',--%>
<%--    //                     'type': 'symbol',--%>
<%--    //                     'source': 'points',--%>
<%--    //                     'layout': {--%>
<%--    //                         'icon-image': 'custom-marker',--%>
<%--    // // get the title name from the source's "title" property--%>
<%--    //                         'text-field': ['get', 'title'],--%>
<%--    //                         'text-font': [--%>
<%--    //                             'Open Sans Semibold',--%>
<%--    //                             'Arial Unicode MS Bold'--%>
<%--    //                         ],--%>
<%--    //                         'text-offset': [0, 1.25],--%>
<%--    //                         'text-anchor': 'top'--%>
<%--    //                     }--%>
<%--    //                 });--%>
<%--    //             }--%>
<%--    //         );--%>
<%--    //     });--%>


<%--</script>--%>

</body>
</html>

