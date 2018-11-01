class UsersController < ApplicationController

	def create
		
		@user=User.create(student_params) 
  		if @user.valid?
  			session[:user_id] = @user.id 
  			flash[:success] = "New User has been created"
  			redirect_to '/trips'
  		else
  			flash[:danger] = @user.errors.full_messages
  			redirect_to '/users/register'
  		end
	end

  def show
      @user=User.find(session[:user_id])
      @trips=Trip.all
      @attends=Attend.find(trip_id: params[:id], user_id: session[:user_id])
  end

	def student_params
      puts params
     	params.require(:user).permit(:first_name, :last_name, :email, :age, :password, :password_confirmation)
    end
end
