class RidesController < ApplicationController
   
   def create 
     @attraction = Attraction.find_by(id: rides_params)
     @user = current_user
     @ride_message = Ride.create(user_id: @user.id, attraction_id: @attraction.id).take_ride
     redirect_to user_path(@user),alert: @ride_message
   end
   
private 
  def rides_params
    params.require(:attraction_id)
  end    
end