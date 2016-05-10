$(document).ready(function() {
  $(".each-tag").on('submit', function( event ) {
    event.preventDefault();
    var $info = $(".each-tag input").serialize();
    var tagLi = $(this).parent()
    
    $.ajax({
      method: "DELETE",
      url: '/tags',
      data: $info
    }).done(function( html ) {
      $( tagLi ).remove();
    });
  });
});
