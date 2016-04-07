class UsersController < ApplicationController
    
  def new
    @user = User.new 
  end
  
  def create
    @user = User.create(user_params)
    if user_params[:admin] == 1 
      @user.admin = true
      @user.save 
    end
    session[:user_id] = @user.id
    
    redirect_to user_path(@user),alert: "Sucessfully Created."
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    @user.save 
    redirect_to user_path(@user),alert: "Sucessfully Updated."
  end
  
  def show 
    @user = User.find_by(id: params[:id])
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy 
    redirect_to root_path
  end
  
private 
  def user_params 
    params.require(:user).permit(:name,:nausea,:happiness,:tickets,:height,:admin)
  end
end
