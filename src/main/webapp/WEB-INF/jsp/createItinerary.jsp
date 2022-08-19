<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%--<c:url var="validationJs" value="/js/user-validation.js" />--%>
<%--<script src="${validationJs}"></script>--%>


<%-- the form part of the website />--%>
<c:url var="formAction" value="/itinerary/create/1" />
<form:form method="POST" action="${formAction}" modelAttribute="itinerary">
    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="name">Trip Name: </label>
                <input type="text" id="name" name="name" placeHolder="Trip Name" class="form-control" />
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
</form:form>

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
        body { margin: 0; padding: 0; }
        #map { position: absolute; top: 375px; bottom: 0; width: 50%; }
    </style>
</head>
<body>
<!-- Load the `mapbox-gl-geocoder` plugin. -->
<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.min.js"></script>
<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v5.0.0/mapbox-gl-geocoder.css" type="text/css">

<div id="map"></div>

<script>
    mapboxgl.accessToken = 'pk.eyJ1Ijoic29ja3Nyb2NrIiwiYSI6ImNsNno3OTh4YzAxbmIzeHBiM3E5b3dxeTkifQ.dQS6hDACss4VM7ifRg2l7A';
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/socksrock/cl6z7fpw9000i14klmkauspuj',
        center: [-79.4512, 43.6568],
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
        addMarker(event.lngLat.lng, event.lngLat.lat)
        $('savePinModal').modal('show');
    })

    function addMarker(lng, lat) {
        const marker = new mapboxgl.Marker({
            draggable: true
        })

        .setLngLat([lng,lat])
        .addTo(map);
    }



//     map.on('load', () => {
// // Add an image to use as a custom marker
//         map.loadImage(
//             'https://docs.mapbox.com/mapbox-gl-js/assets/custom_marker.png',
//             (error, image) => {
//                 if (error) throw error;
//                 map.addImage('custom-marker', image);
// // Add a GeoJSON source with 2 points
//                 map.addSource('points', {
//                     'type': 'geojson',
//                     'data': {
//                         'type': 'FeatureCollection',
//                         'features': [
//                             {
// // feature for Mapbox DC
//                                 'type': 'Feature',
//                                 'geometry': {
//                                     'type': 'Point',
//                                     'coordinates': [
//                                         -77.03238901390978, 38.913188059745586
//                                     ]
//                                 },
//                                 'properties': {
//                                     'title': 'Mapbox DC'
//                                 }
//                             },
//                             {
// // feature for Mapbox SF
//                                 'type': 'Feature',
//                                 'geometry': {
//                                     'type': 'Point',
//                                     'coordinates': [-122.414, 37.776]
//                                 },
//                                 'properties': {
//                                     'title': 'Mapbox SF'
//                                 }
//                             }
//                         ]
//                     }
//                 });
//
// // Add a symbol layer
//                 map.addLayer({
//                     'id': 'points',
//                     'type': 'symbol',
//                     'source': 'points',
//                     'layout': {
//                         'icon-image': 'custom-marker',
// // get the title name from the source's "title" property
//                         'text-field': ['get', 'title'],
//                         'text-font': [
//                             'Open Sans Semibold',
//                             'Arial Unicode MS Bold'
//                         ],
//                         'text-offset': [0, 1.25],
//                         'text-anchor': 'top'
//                     }
//                 });
//             }
//         );
//     });


</script>

</body>
</html>


<%-- modal pop up about asking user to save pin />--%>
<div class="modal" tabindex="-1" role="dialog" id="savePinModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Save this pin as a landmark?</h5>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
                    <span aria-hidden="true">&times;</span>
<%--                </button>--%>
            </div>
            <div class="modal-body">
                <form method="POST" action="${formAction}">
                    <div class="form-group">
                        <label for="landmarkName">Pin Name: </label>
                        <input type="Date" id="landmarkName" name="landmarkName" placeHolder="Pin Name" class="form-control" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />