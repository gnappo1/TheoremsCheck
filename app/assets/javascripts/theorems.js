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
  $("#new_theorem_form").on("click", function(e) {
    btn = $(this);
    $.ajax({
      type: this.method,
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#form_div").html(data);
        $('#form_div').toggle();
      }
    });

    e.preventDefault();
  })
})

$(function() {
  $(document).on('submit','form#new_theorem', {} ,function(e){

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
  $("#nested_theorem_form").on("click", function(e) {
    btn = $(this);

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#form_for_theorem").html(data);
        $('#form_for_theorem').toggle();
      }
    });

    e.preventDefault();
  })
})
