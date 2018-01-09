$(function() {
  $("#edit-button").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      data: $(this).serialize(),
      dataType: 'script'
    });

    debugger
    e.preventDefault();
  })
})

$(function() {
  $(document).on("submit", "#edit_quote_5", function(e) {
    debugger
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.href,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})
