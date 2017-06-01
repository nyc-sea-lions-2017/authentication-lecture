get '/logout' do
  session.clear
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do 
  user = User.find_by(name: params[:name])
  if user && user.authenticated?(params[:password])
    session[:id] = user.id
    redirect '/secret'
  else
    @errors = ["Bad!!!"]
    erb :'/login'
  end
end