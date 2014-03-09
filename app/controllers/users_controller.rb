class UsersController < ApplicationController
	layout 'signup', only: :new

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "恭喜您，注册成功，请重新登陆！"
			redirect_to root_path(email: @user.email), :layout => "signup"
		else
			render 'new', :layout => "signup"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:ename, :cname, :email, 
							:branch_code, :role_id,
							:password, :password_confirmation)
		end
end
