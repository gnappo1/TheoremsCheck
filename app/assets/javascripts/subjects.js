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

$(function() {
  $(document).on("submit", "form#edit_subject_82", function(e) {

    $.ajax({
      type: 'patch',
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})
