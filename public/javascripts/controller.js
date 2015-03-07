$(document).ready(function(){
  var x =1;
  $('.create_question').on('click', function(event){
    event.preventDefault();
    x+=1;
    $('.remove_question').show();
    $('.inputs').append(questionTemplate(x));
  });

  $('.remove_question').on('click', function(event){
    console.log(x)
    $('.input_container')[x-1].remove();
    x-=1;
    if(x === 1) {
      $('.remove_question').css("display", "none");
    }
  });

  $('.signup').on('click', function(event){
    event.preventDefault();
    renderPartial('.signup');
  });

})
