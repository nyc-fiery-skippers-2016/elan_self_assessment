$(document).ready(function() {
  $(".each-tag").submit(function( e ) {
    e.preventDefault();
    var $info = $(".each-tag input").serialize();
    $.ajax({
      method: "DELETE",
      url: '/tags',
      data: $info
    }).done(function( html ) {
      $("ul.all-post-tags").html($(html).find("ul.all-post-tags"))
    })
  });
});
