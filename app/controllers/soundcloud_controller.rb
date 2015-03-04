require 'json'
require 'soundcloud'

class SoundcloudController < ApplicationController
	include SoundcloudHelper

	skip_before_action :verify_authenticity_token

	def index
		begin
			data  = JSON.parse(request.body.read)
			config = YAML.load_file(Rails.root.join('config/secrets.yml'))

			client = SoundCloud.new({
				  :client_id     => config["client_id"]
				  #:client_secret => config["client_secret"],
				  #:username      => config["username"],
				  #:password      => config["password"]
				})

			res = client.get('/resolve', url: data["link"]).to_hash
			track = QueueTrack.new(link: "#{data["link"]}?autoplay=true", title: res["title"], artist: res["user"]["username"], duration: (res["duration"].to_f/1000.0).ceil)
			track.save!
		rescue Exception => ex 
			renderer json:{status: 500, message: ex.inspect}
		end

		render json: {status: 200}
	end

end
