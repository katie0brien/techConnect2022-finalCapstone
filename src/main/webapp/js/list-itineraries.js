function listItineraries()
{
    // const searchCategory = $("#searchCategory").val();
    let url = `/itinerary/list/1`;

    $.get(url,
        // callback function
        (data) => {
            // data is the response data from the server
            const div = $("#itineraryList");
            div.empty();
            div.html(data);
        }
    )
}