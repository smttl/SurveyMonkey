

var questionTemplate = function(x){
  var hey =
  "<div class='input_container'><input type='text' name='questions[question"+x+"[title]]' placeholder='question' /><input type='text' name='questions[question"+x+"[choice1]]' placeholder='choice' class='choice'/><input type='text' name='questions[question"+x+"[choice2]]' placeholder='choice' class='choice'/><input type='text' name='questions[question"+x+"[choice3]]' placeholder='choice' class='choice'/></div>";
  return hey;
}
