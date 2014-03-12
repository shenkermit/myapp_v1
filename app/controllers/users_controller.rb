class UsersController < ApplicationController
	layout 'signup', only: :new
	before_action :signed_in_user, only: [:edit, :update, :show]

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

	def update
		@user = User.find(params[:id])
		_checked = params[:_checked] || '0'
		if _checked == '1'	
			if @user.update_attributes(user_params)
				flash[:success] = "更新成功"
				sign_in @user
				redirect_to @user
			else
				render 'edit'
			end
		else
			if @user.update_attributes(user_params)
				flash[:success] = "更新成功"
				sign_in @user
				redirect_to @user
			else
				render 'edit'
			end
		end
	end

	private
		def user_params
			params.require(:user).permit(:ename, :cname, :email, 
							:branch_code, :role_id,
							:password, :password_confirmation)
		end

		def signed_in_user
			redirect_to root_path, notice: "您还未登陆，请先登陆！" unless signed_in?
		end
end
