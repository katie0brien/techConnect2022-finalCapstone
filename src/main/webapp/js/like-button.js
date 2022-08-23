function likeButton(x) {
    // x.classList.toggle("fa-thumbs-down");
    let url = ``;

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