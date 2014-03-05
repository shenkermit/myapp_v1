class BranchesController < ApplicationController
	def new
		@branch = Branch.new
	end

	def create
		@branch = Branch.new
		@branch.save
	end
end
