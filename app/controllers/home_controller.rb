class HomeController < ApplicationController

	def index
		unless session[:user].blank?
			redirect_to rooms_path
		end
	end

	def create_user
	    # cookies.signed[:username] = params[:user][:username]
	    user = User.where(username: params[:user][:username]).first
	    if user.blank?
			session[:user] = User.create(username: params[:user][:username])
		else
			session[:user] = user
		end

	    redirect_to rooms_path
	end

	def logout
		session[:user] = nil
		redirect_to root_url
	end
end