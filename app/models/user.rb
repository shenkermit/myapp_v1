class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	belongs_to :branch
	belongs_to :role

	validates_presence_of :ename, message: '英文名不能为空'
	validates_presence_of :cname, message: '中文名不能为空'
	validates_presence_of :email, message: '邮箱地址不能为空'
	validates_presence_of :branch_id, message: '所属分支机构不能为空'
	#validates_presence_of :role_id, message: '角色名不能为空'

	validates :ename, :length=>{ maximum: 10, too_long: '英文名不得超过10位' }
	validates :cname, :length=>{ maximum: 10, too_long: '中文名不能超过5位' }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { with: VALID_EMAIL_REGEX, :message => '邮箱格式不正确' },
		uniqueness: { case_sensitive: false, :message => '您的邮箱已被注册' }

	validates_length_of :password, :within => 6..10, message: '密码长度错误，应在6到10位之间', allow_nil: true

	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def admin?
		self.role_id == 1
	end

	private
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
