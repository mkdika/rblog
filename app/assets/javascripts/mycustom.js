$(document).on('turbolinks:load', function() {
  $(".notification > button.delete").click(function() {
    $(this).parent().addClass('is-hidden');
  });

  $(".navbar-burger").click(function() {
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");
      $(".navbar-end").toggleClass("is-active");
  });
});