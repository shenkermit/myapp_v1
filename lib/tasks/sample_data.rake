namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_branches
		make_roles
	end
end

def make_users
	User.create(ename: "001",
				cname: "凹凸曼1号",
				email: "001@qq.com",
				branch_id: '1',
				role_id: '1',
				password: "123456",
				password_confirmation: "123456")

	User.create(ename: "002",
				cname: "凹凸曼2号",
				email: "002@qq.com",
				branch_id: '2',
				role_id: '2',
				password: "123456",
				password_confirmation: "123456")
end

def make_branches
	Branch.create(branch_code: "0000",
				branch_name: "屌丝0")

	Branch.create(branch_code: "0001",
				branch_name: "屌丝1")
end

def make_roles
	Role.create(role_name: "admin",
				role_cname: "管理员",
				role_content: "all")
	Role.create(role_name: "user",
				role_cname: "普通用户",
				role_content: "part")
end
