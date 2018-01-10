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
