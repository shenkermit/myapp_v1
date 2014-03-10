class BranchesController < ApplicationController
	before_action :signed_in_user

	def new
		@branch = Branch.new
	end

	def create
		@branch = Branch.new
		@branch.save
	end

	private
		def signed_in_user
			redirect_to root_path, notice: "您还未登陆，请先登陆！" unless signed_in?
		end
end
