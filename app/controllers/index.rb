get '/' do
  redirect '/users/new'
end


get '/secret' do
  if session[:id]
    erb :'/secret'
  else
    redirect '/'
  end
end