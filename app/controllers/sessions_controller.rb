class SessionsController < ApplicationController
	layout 'signup', only: :new

	def new
		@new_email = params[:email].downcase unless params[:email].nil?
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to root_path
		else
			flash.now[:error] = '邮箱地址/密码不正确。'
			render 'new', :layout => "signup"
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
