module Admin
class EventSubmissionsController < ApplicationController
	def index
		@event =[]
		Event.all.each do |f|
			if f.validated? == false || nil && f.user != nil
				@event << f
			end
		end
	end
		def show
			@a =params[:id] 
			@event =Event.find(@a)
			@event.attendances.each do |l|
				@u = l.user
			end
		end
		def update
			
			@a=params[:id]
			@event =Event.find(@a)
			@event.update(validated:params[:validation])
			@event.save
			flash.now[:notice] ="Vouvenez de modifir votre evenement"
			redirect_to admin_event_submission_path(@a)

		end
		def destroy
			@a =params[:id]
			@event =Event.find(@a)
			@event.destroy
			flash.now[:notice] ="Vous venez d'ffacer votre evenement"
			redirect_to admin_event_submissions_all_path
		end
		def all
			@event =[]
			Event.all.each do |d|
			if  d.user != nil
				@event << d
			end
		end
		end
		def valid
			@a = params[:id]
			@event =Event.find(@a)
			@event.update(validated:true)
            @event.save
            redirect_to admin_event_submissions_all_path
		end
	end

end