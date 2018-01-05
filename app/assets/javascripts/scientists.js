$(function() {
  $("#new_scientist_form").on("click", function(e) {

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
  $("#index_quote").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#quotes_by_scientist").html(data);
        $('#quotes_by_scientist').toggle();
      }
    });
    e.preventDefault();
  })
})

$(function() {
  $("#index_theorems").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#theorems_by_scientist").html(data);
        $('#theorems_by_scientist').toggle();
      }
    });
    e.preventDefault();
  })
})

$(function() {
  $("#new_quote_form").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("#form_for_quote").html(data);
        $('#form_for_quote').toggle();
      }
    });

    e.preventDefault();
  })
})

$(function() {
  $(document).on('submit', 'form#new_quote', {} , function(e){

    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });
    e.preventDefault();
  })
})
