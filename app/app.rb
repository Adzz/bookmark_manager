ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative "../data_mapper_setup.rb"
require_relative "./models/link.rb"
require_relative "./models/tags.rb"
require_relative "./models/users.rb"



class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'secret super'

  get "/" do
    redirect "/users/new"
  end

  get '/users/new' do
    @user = User.new
    erb :signup
  end

  post '/users/new' do
    @user = User.create(name: params[:name],
    email: params[:email], 
    password: params[:password], 
    password_confirmation: params[:passwordconf])
    if @user.save
      session[:user_id] = @user.id
      redirect "/bookmarks"
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :signup
    end
  end

  get '/bookmarks' do
  	@links = Link.all
    erb :homepage
  end

  get "/addlink" do
  	erb :addlink
  end

  post "/addlink" do
    link = Link.create(url: params[:URL], name: params[:Name])
    params[:tag].split(", ").each do |tag|
      link.tags << Tag.create(tag: tag)
    end
    link.save                            
    redirect to('/bookmarks')
  end

  post "/tags/:tag" do
     tag = Tag.first(tag: params[:filter])
     if tag
      @links = tag.links
      erb :filtered
     else
      redirect "/bookmarks"
     end
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end
 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
