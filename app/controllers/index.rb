enable :sessions

get '/' do
  # Look in app/views/index.erb
  if session[:userid]
    @theuser = User.find(session[:userid]).username
    @albums = User.find(session[:userid]).albums
  end
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  if User.where(username: params[:username]).first
    user = User.where(username: params[:username]).first
    if user.password == params[:password]
      session[:userid] = user.id
      redirect '/'
    else
      redirect '/login'
    end
  else
    user1 = User.create(username: params[:username], password: params[:password])
    session[:userid] = user1.id
    redirect '/'
  end

end

get '/logout' do
  session[:userid] = nil
  redirect '/'
end

get '/createalbum' do
  @theuser = User.find(session[:userid]).username
  erb :createalbum
end

post '/createalbum' do
  newalbum = Album.create(title: params[:title])
  user = User.find(session[:userid])
  user.albums << newalbum
  redirect "/album/#{newalbum.id}"
end

get '/albums' do
  redirect '/'
end

get '/albums/:id' do
  @album = Album.find(params[:id])
  @theuser = User.find(session[:userid]).username
  erb :album
end

post '/albums/:id' do
    photo = Album.find(params[:id]).photos.new()
    photo.file = params[:image]
    photo.title = params[:title]
    photo.save
    redirect back
end