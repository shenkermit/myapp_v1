class StaticPagesController < ApplicationController
	before_action :signed_in_user

	def home
	end

	private
	def signed_in_user
		redirect_to root_path, notice: "您还未登陆，请先登陆！" unless signed_in?
	end
end
