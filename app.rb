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

  post "/addlink" do
    link = Link.new(url: params[:URL], name: params[:Name])
    tag  = Tag.first_or_create(tag: params[:tag])
    link.tags << tag                       
    link.save                              
    redirect to('/')
  end

  post "/tags" do
     tag = Tag.first(tag: params[:filter])
     @links = tag.tag ? tag.links : []
    erb :filtered
  end

 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
