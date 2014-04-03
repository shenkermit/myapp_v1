class UsersController < ApplicationController
	layout 'signup', only: :new
	before_action :signed_in_user, only: [:edit, :update, :show, :index]
	before_action :correct_user, only: [:edit, :update]
	before_action :admin_user, only: [:destroy]

	def index
		@users = User.all
		#@users = User.paginate(page: params[:page], per_page: 10)
	end

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
				flash[:success] = "更新成功!"
				sign_in @user
				redirect_to @user
			else
				render 'edit'
			end
		else
			if @user.update_attributes(user_params)
				flash[:success] = "更新成功!"
				sign_in @user
				redirect_to @user
			else
				render 'edit'
			end
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "用户【#{@user.cname}】，删除成功!"
		redirect_to users_path
	end

	def password
		@user = User.find(params[:id])
	end

	def change_password
		@user = User.find(params[:id])
	end

	private
		def user_params
			params.require(:user).permit(:ename, :cname, :email, 
							:branch_id, :role_id,
							:password, :password_confirmation)
		end

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to root_path, notice: "您还未登陆，请先登陆！"
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to home_path, notice: "对不起，您不能查看他人的资料！" unless current_user?(@user)
		end

		def admin_user
			redirect_to home_path, notice: "对不起，只有管理员才能进行此操作！" unless current_user.admin?
		end
end
