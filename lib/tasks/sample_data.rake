namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_branches
	end
end

def make_users
	User.create(ename: "001",
				cname: "凹凸曼",
				email: "001@qq.com",
				branch_code: "0000",
				role_id: "admin",
				password: "123456",
				password_confirmation: "123456")
end

def make_branches
	Branch.create(branch_code: "0000",
				branch_name: "屌丝0")

	Branch.create(branch_code: "0001",
				branch_name: "屌丝1")
end