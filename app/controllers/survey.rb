get '/surveys/new' do
  erb :'survey/new'
end

post '/surveys' do
  @survey = Survey.create(params[:survey])
  redirect 'users/<%= @user.id %>'
end

get '/surveys/:id' do
 @survey = Survey.find(params[:id])
 @questions = @survey.questions
 erb :'survey/show'
end

delete '/surveys/:id' do
  Survey.find(id).destroy
  redirect 'users/<%= @user.id %>'
end

get '/survey/new' do
  erb :form
end

post '/survey/create' do
  survey_title = params[:title]
  new_survey = Survey.create(title: survey_title)
  questions = params[:questions]
  questions.each do |key, value|
    new_question = Question.create(title: value['title'], survey: new_survey)
    Choice.create(question: new_question, title: value['choice1'])
    Choice.create(question: new_question, title: value['choice2'])
    Choice.create(question: new_question, title: value['choice3'])
  end
  redirect '/'
end
