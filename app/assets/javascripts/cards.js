// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  $('#card-search-form').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
      method: $(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      datatype: 'json'
    }).done(function(data) {
      $('card-results').prepend(data)
    }).fail(function(data) {
      console.log("didn't work");
    }).always(function() {
      console.log("AJAX did a thing");
    });
  });
});
