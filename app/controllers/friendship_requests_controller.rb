class FriendshipRequestsController < ApplicationController
  def create
    @requested_user = User.find(params[:to_user_id])
    
    if !current_user.nil? && !@requested_user.nil?
      send_friend_request(current_user, @requested_user)
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
      flash[:success] = "Your friend request has been sent!"
    else
      flash[:notice] = "It seems you can't add this person as a friend."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @requested_user = User.find(params[:to_user_id])
    @friendship_request = current_user.friendship_requests.find_by(to_user_id: params[:to_user_id])
    @friendship_request.destroy
    
    respond_to do |format|
      format.html { 
        flash[:success] = "Your friend request has been undone!"
        redirect_back(fallback_location: root_path) 
      }
      format.js
    end
  end
end
