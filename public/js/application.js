$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('#slider1').bxSlider({
  mode: 'fade',
  auto: true,
  autoControls: true,
  pause: 2000,
  slideHeight: 200
  });

});
