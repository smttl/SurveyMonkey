get '/surveys/new' do
  erb :form
end

get '/surveys/:id' do
 @survey = Survey.find(params[:id])
 @questions = @survey.questions
 erb :'survey/show'
end

get '/surveys/:id/stats' do
 @survey = Survey.find(params[:id])
 @questions = @survey.questions
 @responses = Response.where(survey: @survey)
 erb :'survey/stats'
end

post '/surveys/create' do
  survey_title = params[:title]
  user = User.find(session[:user_id])
  new_survey = Survey.create(title: survey_title, user: user)
  questions = params[:questions]
  questions.each do |key, value|
    new_question = Question.create(title: value['title'], survey: new_survey)
    Choice.create(question: new_question, title: value['choice1'])
    Choice.create(question: new_question, title: value['choice2'])
    Choice.create(question: new_question, title: value['choice3'])
  end
  redirect '/'
end

get '/surveys/:id' do
 @survey = Survey.find(params[:id])
 @questions = @survey.questions
 erb :'survey/show'
end

get '/surveys/:id/edit' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'survey/edit'
end

put '/surveys/:id' do
 @survey = Survey.find(params[:id])
 @questions = @survey.questions
 survey_title = params[:title]
 @survey.update(title: survey_title)
 new_questions = params[:questions]
 value = new_questions.values.first
 @questions.each do |question|
  question.update(title: value['title'])
  i = 1
  question.choices.each do |choice|
    choice.update(title: value["choice#{i}"])
    i += 1
  end
end
 redirect "/"
end

delete '/surveys/:id' do
  Survey.find(params[:id]).delete
  redirect "/"
end


