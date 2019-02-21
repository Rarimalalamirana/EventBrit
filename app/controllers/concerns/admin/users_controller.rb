module Admin
class UsersController < ApplicationController
	def index
		@user =User.all
	end
		def show
			@a =params[:id] 
			@user =User.find(@a)
		
		end
		def update
			
			@a=params[:id]
			@event =Event.find(@a)
			@event.update(validated:params[:validation])
			@event.save
			flash.now[:notice] ="Vouvenez de modifir votre evenement"
			redirect_to event_path(@a)

		end
		def destroy
			@a =params[:id]
			@user =User.find(@a)
			@user.destroy
			flash.now[:notice] ="Vous venez d'ffacer votre evenement"
			redirect_to admin_users_path
		end
	end

end