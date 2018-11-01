class AttendsController < ApplicationController

	def index
	
	end
	
	def show
		puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
		@user = User.find(session[:user_id])
		@attending = Attend.where(user_id: session[:user_id]).all
	end

	def create
		@user = User.find(session[:user_id])
		@trip = Trip.find(params[:id])
		@attend = Attend.create(trip_id: params[:id], user_id: session[:user_id])
		redirect_to '/trips'
	end

	def destroy
		puts '**********************************'
		@attend=Attend.where(user_id: session[:user_id], trip_id: params[:id])
		@attend.destroy_all()
		flash[:success] = "Trip cancelled"
		redirect_to '/attends/:id'
	end
	
end
