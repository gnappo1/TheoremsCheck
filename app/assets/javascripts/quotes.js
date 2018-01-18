$(function() {
  $("#edit-button").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})

$(function() {
  $(document).on("submit", ".form-horizontal", function(e) {
    debugger

    $.ajax({
      type: 'patch',
      url: this.href,
      data: $(this).serialize(),
      dataType: 'script'
    });
    e.preventDefault();
  })
})

$(function() {
  $(document).on("submit", "form.button_to", function(e) {

    $.ajax({
      type: 'delete',
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})

$(function() {
  $("#jolly-button").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})
