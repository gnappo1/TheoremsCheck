$(document).off('submit');
$(function() {
  $("#new_subject").on("submit", function(e) {

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
  $("input#delete").on("click", function(e) {

    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script',
      success: function(response) {
        debugger
      }
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
