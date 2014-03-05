class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates_presence_of :ename, message: '英文名不能为空'
	validates_presence_of :cname, message: '中文名不能为空'
	validates_presence_of :email, message: '邮箱地址不能为空'
	validates_presence_of :branch_code, message: '所属分支机构不能为空'
	validates_presence_of :role_id, message: '角色名不能为空'

	validates :ename, length: { maximum: 10 }
	validates :cname, length: { maximum: 10 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, length: { minimum: 6 }
end
