var renderPartial = function(className){
  var url = $(className).attr('href');
  $.get(url, function(response){
    $('.container').html(response);
  })
}