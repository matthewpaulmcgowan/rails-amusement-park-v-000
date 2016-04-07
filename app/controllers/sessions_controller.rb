class SessionsController < ApplicationController
   
   def new 
     @users = User.all
   end
   
   def create
     @user = User.find_by(id: session_params[:id])  
     session[:user_id] = @user.id 
     redirect_to user_path(@user),alert: "Sucessfully Created"
   end
   
   def destroy 
     @user = User.find_by(id: params[:id])
     session.destroy
     redirect_to root_path, alert: "Sucessfully Signed Out"
   end
   
private 
  def session_params
    params.require("user").permit("id")
  end
end