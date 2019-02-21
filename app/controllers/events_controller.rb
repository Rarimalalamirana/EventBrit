class EventsController < ApplicationController
	before_action:current_user,only:[:subscride,:new]
	def index
	 @event=[]
	Event.all.each do |f|
     if f.validated? == true && f.user != nil
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
	def new
		if current_user
		@event=Event.new
	else
		redirect_to events_path
	end
	end
	def create

         @currentUser=current_user
		a= params.require(:event).permit(:avatar,:title,:description,:duration,:location,:price,:start_date)	
		@event =Event.new(a)
		@event.user =@currentUser
		
		if @event.valid?
			@event.save
		
			redirect_to events_path
		else
			render :new
		end
	end
	def subscride
		  @a =params[:id]
		  @vent=Event.find(@a)
		   @user =current_user
		  @amount = @vent.price

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )
	puts "*" *20	
		@att =Attendance.new
        @att.event =@vent
        @att.user = @user
		@att.save
	redirect_to event_path(@a)
rescue Stripe::CardError => e
  flash[:error] = e.message

	end
	def update
		@a=params[:id]
		@event =Event.find(@a)
		@event.update(location:params[:location],title:params[:title],description:params[:description],start_date:params[:start_date],duration:params[:duration],price:params[:price])
         @event.avatar.attach(params[:avatar])
         @event.save
           flash.now[:notice] ="Vous venez de modifir votre evenement"
         redirect_to event_path(@a)

	end
	def destroy
		@a =params[:id]
		@event =Event.find(@a)
		@event.destroy
		flash.now[:notice] ="Vous venez d'ffacer votre evenement"
		redirect_to events_path
	end

end
