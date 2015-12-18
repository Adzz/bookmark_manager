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
    link = Link.create(url: params[:URL], name: params[:Name])
    params[:tag].split(", ").each do |tag|
      link.tags << Tag.create(tag: tag)
    end
    link.save                            
    redirect to('/')
  end

  post "/tags/:tag" do
     tag = Tag.first(tag: params[:filter])
     if tag
      @links = tag.links
      erb :filtered
     else
      redirect "/"
     end
  end
 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
