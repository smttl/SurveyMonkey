get '/login' do
  if session[:user_id]
    redirect "/user/#{session[:user_id]}"
  else
    erb :login
  end
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] =user.id
    redirect "/user/#{user.id}"
  else
    session[:message] = "Invalid username and/or password"
    redirect '/login'
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(name: params[:name], password: params[:password])
  session[:user_id] = user.id
  redirect "user/#{user.id}"
end

post '/logout' do
  session.delete(:user_id)
  redirect '/login'
end

get '/user/:user_id' do
  @user = User.find(params[:user_id])
  erb :userpage
end