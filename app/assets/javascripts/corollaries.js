$(function() {
  $("a#corollaries_button").on("click", function(e) {
    $.getJSON(this.href).success(function(json) {
      var $ol = $("div.corollaries ol")
      $ol.html("")

      json.forEch(function(corollary) {
        $ol.append("<li>" + corollary.content + "</li>");
      })
    })
    e.preventDefault();
  })
})
