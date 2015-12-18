require 'dm-validations'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
	property :name, String
	property :email, String
	property :password, BCryptHash


	validates_confirmation_of :password




end

