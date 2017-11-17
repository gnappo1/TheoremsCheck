var clicks = true;
$(function() {
  $("a#corollaries_button").on("click", function(e) {
    if (clicks) {
      $.ajax({
        type: "GET",
        headers: { 'Cache-Control': 'max-age=0' },
        url: this.href,
        datatype: 'script',
      });
      clicks = false;
    } else {
      $("div.corollaries .frame").hide()
      clicks = true;
    }

    e.preventDefault();
  })
})
