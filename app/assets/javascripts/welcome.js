$(function() {
  $("#jolly_button").on("click", function(e) {
    btn = $(this);

    $.ajax({
      type: "GET",
      url: this.href,
      cache: false,
      data: $(this).serialize(),
    });

    e.preventDefault();
  })
})
