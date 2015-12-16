require 'data_mapper'
require 'dm-postgres-adapter'

class Link

	include DataMapper::Resource

	has n, :tags, through: Resource

		property :id, Serial
		property :url, URI
		property :name, String



	end