// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require turbolinks
//= require bootstrap
//= require bootstrap-datetimepicker.min
//= require_tree .


$(document).ready(function() {
	$('.alert').delay(1000).fadeOut()

  $('.show_closed_tickets').click(function(e) {
    e.preventDefault();
    $('.closed_tickets, .hide_closed_tickets').show()
    $(this).hide()
  })

  $('.hide_closed_tickets').click(function(e) {
    e.preventDefault();
    $('.closed_tickets, .hide_closed_tickets').hide()
    $('.show_closed_tickets').show()
  })

  $('.disabled').attr('disabled', true)
})