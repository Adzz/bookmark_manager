require "data_mapper"
require "dm-postgres-adapter"

require './app/models/tags'
require './app/models/link'
require './app/models/users'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize