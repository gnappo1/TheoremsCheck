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
