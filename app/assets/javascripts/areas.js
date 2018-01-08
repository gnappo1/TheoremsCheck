$(document).off('submit');
$(function() {
  $("#new_area").on("submit", function(e) {

    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})

$(function() {
  $(document).on("click", "#edit-button", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})
