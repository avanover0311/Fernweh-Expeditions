class TripsController < ApplicationController
	
	def index
		 @user = User.find(session[:user_id])
		 @trip = Trip.all
		 
	end

	def show
		
	end

	def create 
		@user = User.find(session[:user_id])
		@trip = Trip.find(params[:id])
		@attends=Attend.create(trip_id: params[:id], user_id: session[:user_id])
		redirect_to '/trips'
	end

	def destroy
		@attend=Attend.find(user_id: session[:user_id], trip_id: params[:trip_id])
		@attend.destroy_all()
		flash[:success] = "Trip cancelled"
		redirect_to '/trips'
	end
end
