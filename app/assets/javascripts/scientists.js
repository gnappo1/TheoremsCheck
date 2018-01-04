$(function() {
  $("#new_scientist_form").on("click", function(e) {
    btn = $(this);

    $.ajax({
      type: "GET",
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
  $(document).on('submit','form#new_scientist', {} ,function(e){

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
  $("#new_quote_form").on("click", function(e) {
    btn = $(this);

    $.ajax({
      type: "GET",
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
  $("#nested_theorem_form").on("click", function(e) {
    btn = $(this);

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#form_theorem_div").html(data);
        $('#form_theorem_div').toggle();
      }
    });

    e.preventDefault();
  })
})
