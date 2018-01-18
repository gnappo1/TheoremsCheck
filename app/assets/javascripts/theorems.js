$(function() {
  $(document).off().on("click", "#new_theorem_form_div", function(e) {
    debugger

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      dataType: 'script',
      success: function(data) {
        $("div#form_divs").html(data);
        $('#form_divs').toggle();
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
  $("#edit-theorem-button").on("click", function(e) {

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
      success: function(data) {
        $("div.edit_form").html(data);
        $('div.edit_form').toggle();
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

$(function() {
  $(document).on("submit", "form#edit_theorem_6", function(e) {

    $.ajax({
      type: 'patch',
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    debugger
    e.preventDefault();
  })
})

$(function() {
  $(document).on("submit", "form.button_to", function(e) {

    $.ajax({
      type: 'delete',
      url: this.action,
      data: $(this).serialize(),
      dataType: 'script'
    });

    e.preventDefault();
  })
})
