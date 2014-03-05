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
			redirect_to @user
		else
			render 'new', :layout => "signup"
		end
	end

	private
		def user_params
			params.require(:user).permit(:ename, :cname, :email, 
							:branch_code, :role_id,
							:password, :password_confirmation)
		end
end
