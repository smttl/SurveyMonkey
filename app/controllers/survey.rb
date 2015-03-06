get '/surveys/new' do
  erb :'survey/new'
end

post '/surveys/:id' do
  @survey = Survey.create(params[:survey])
  redirect 'users/<%= @user.id %>'
end

delete '/surveys/:id' do
  Survey.find(id).destroy
  redirect 'users/<%= @user.id %>'
end
