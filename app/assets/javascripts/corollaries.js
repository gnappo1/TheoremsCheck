$(function() {
  $(document).on('submit','form#new_corollary', {} ,function(e){

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
  $("#corollaries_button").off("click").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#corollaries").html(data);
        $('#corollaries').toggle();
      }
    });

    e.preventDefault();
  })
})

$(function() {
  $("#new_corollary_button").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#new_corollary_section").html(data);
        $('#new_corollary_section').toggle();
      }
    });

    e.preventDefault();
  })
})

$(function() {
  $('body').on("click", "#edit-button", function(e) {

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
  $('body').on("submit", "form.button_to", function(e) {

    $.ajax({
      type: 'delete',
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})
