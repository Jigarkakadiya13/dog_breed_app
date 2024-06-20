$(document).ready(function() {
  $('#breedForm').submit(function(e) {
    e.preventDefault();
    var breed = $('#breedInput').val();
    $.ajax({
      url: '/dog_breeds/fetch_image',
      method: 'POST',
      data: { breed: breed },
      success: function(response) {
        $('#breedImage').html(`<h2>${breed}</h2><img src="${response.message}" alt="${breed}" style="max-inline-size: -webkit-fill-available;">`);
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  });
});
