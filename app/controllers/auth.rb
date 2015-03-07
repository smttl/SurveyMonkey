get '/' do
  if session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    erb :login
  end
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] =user.id
    redirect "/users/#{user.id}"
  else
    session[:message] = "Invalid username and/or password"
    redirect '/'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(name: params[:name], password: params[:password])
  session[:user_id] = user.id
  redirect "users/#{user.id}"
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end


get '/users/:id' do
  @user = User.find(params[:id])
  @surveys = Survey.all
  @user_surveys = Survey.where(user: @user)
  erb :user_show
end
