require "data_mapper"
require "dm-postgres-adapter"

require './models/tags'
require './models/link'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize.auto_upgrade!