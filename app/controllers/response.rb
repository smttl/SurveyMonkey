post '/take_survey'do
  puts params
  user = User.find(session[:user_id])
  params.each do |key, value|
    question = Question.find(key.to_i)
    choice = Choice.find(value.to_i)
    user.responses.create(question: question, choice: choice, survey: question.survey)
  end
  redirect "/users/#{user.id}"
end
