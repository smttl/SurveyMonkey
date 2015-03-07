

var questionTemplate = function(x){
  var hey =
  "<div class='input_container'><span class='input'><input type='text' name='questions[question"+x+"[title]]' placeholder='question' /></span><span class='input'><input type='text' name='questions[question"+x+"[choice1]]' placeholder='choice' class='choice'/></span><span class='input'><input type='text' name='questions[question"+x+"[choice2]]' placeholder='choice' class='choice'/></span><span class='input'><input type='text' name='questions[question"+x+"[choice3]]' placeholder='choice' class='choice'/><br><br></span></div>";
  return hey;
}
