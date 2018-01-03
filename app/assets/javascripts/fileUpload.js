$(function() {
    // Configure Cloudinary
    // with credentials available on
    // your Cloudinary account dashboard
    $.cloudinary.config({ cloud_name: 'dy6uvdlxh', api_key: '534847379387188'});

    // Upload button
    var uploadButton = $('#upload-button');

    // Upload button event
    uploadButton.on('click', function(e){
        // Initiate upload
        cloudinary.openUploadWidget({ cloud_name: 'dy6uvdlxh', upload_preset: 'mbjs8e2o', tags: ['cgal']},
        function(error, result) {
            if(error) console.log(error);
            // If NO error, log image data to console
            var id = result[0].public_id;
            console.log(processImage(id));
        });
    });
})

function processImage(id) {
    var options = {
        client_hints: true,
    };
    return '<img src="'+ $.cloudinary.url(id, options) +'" style="width: 100%; height: auto"/>';
}

$(document).on('cloudinarywidgetsuccess', function(e, data) {
    // Get the public_id of the image you would like to upload from the response
    public_id = data[0].public_id;
    // Create the necessary URL
    var img = $.cloudinary.image(public_id, { width: 200, height: 200, crop: "crop", gravity: "custom" });
    // Add it to the element
    $("#post-<%= @post.id %>").html(img[0].outerHTML);
});
