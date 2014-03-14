class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.where(username: params[:username]).first
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome"
			redirect_to root_path
		else
			flash[:error] = "Something went wrong, try again"
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Youv'e logged out."
		redirect_to root_path
	end
end