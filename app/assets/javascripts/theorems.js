$(function() {
  $("#corollaries_button").on("click", function(e) {
    btn = $(this);

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
    btn = $(this);
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
  $("body").on("click", "#new_theorem_form", function(e) {
    btn = $(this);
    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        debugger
        $("#form_div").html(data);
        $('#form_div').toggle();
      }
    });

    e.preventDefault();
  })
})
