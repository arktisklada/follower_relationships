class HomeController < ApplicationController
	def index
		@users = User.all
	end
	def follow
		followed_user = User.find(params[:following_id])
		relationship = followed_user.following_relationships.new(follower_id: current_user.id)
		relationship.save
		redirect_to root_url
	end

end
