require 'singleton'
require 'yaml'

module SoundcloudHelper
	class Client
		include Singleton

		@@client 

		def initialize
			config = YAML.load_file(Rails.root.join('config/secrets.yml'))



			@@client = SoundCloud.new({
			  :client_id     => config["client_id"],
			  #:client_secret => config["client_secret"],
			  #:username      => config["username"],
			  #:password      => config["password"]
			})
		end

		def self.client
			@@client
		end

	end
end
