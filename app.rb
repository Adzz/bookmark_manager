ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative "data_mapper_setup.rb"
require_relative "models/link.rb"
require_relative "models/tags.rb"



class BookmarkManager < Sinatra::Base



  get '/' do
  	@links = Link.all
    erb :homepage
  end

  get "/addlink" do
  	erb :addlink
  end

  post "/linkadded" do
    link = Link.new(url: params[:URL], name: params[:Name])
    tag  = Tag.create(name: params[:tag])
    link.tags << tag                       
    link.save                              
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
