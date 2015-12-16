require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Link

	include DataMapper::Resource

		property :id, Serial
		property :url, URI
		property :name, String

	end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper.finalize.auto_upgrade!