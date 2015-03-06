get '/surveys/new' do
  erb :'survey/new'
end

post '/surveys' do
  @survey = Survey.create(params[:survey])
  redirect 'users/<%= @user.id %>'
end

get '/surveys/:id' do
 @survey = Survey.find(id)
 @questions = @survey.questions
 erb :'survey/show'
end

delete '/surveys/:id' do
  Survey.find(id).destroy
  redirect 'users/<%= @user.id %>'
end
