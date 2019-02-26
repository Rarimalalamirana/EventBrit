class UsersController < ApplicationController
	def show
		@user =current_user
		@event =Event.where(user_id:@user.id)
	end
	def index
		@user =User.all
	end
	def destroy
	end
	def update
		p "***********"
		@user =current_user

		@user.update(last_name:params[:last_name],first_name:params[:first_name],description:params[:description],email:params[:email])
		@user.avatar.attach(params[:avatar])
		redirect_to root_path
	end

end
