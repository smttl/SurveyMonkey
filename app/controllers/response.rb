post '/take_survey' do
  content_type :json
  user = User.find(session[:user_id])
  survey = Question.find(params.keys.first.to_i).survey
  if Response.find_by(user: user, survey: survey)
    return {output: 2}.to_json
  else
    params.each do |key, value|
      question = Question.find(key.to_i)
      choice = Choice.find(value.to_i)
      user.responses.create(question: question, choice: choice, survey: question.survey)
    end
    return {output: 1}.to_json
  end
end
