class FriendshipRequestsController < ApplicationController

  def index
    @friendship_requests = FriendshipRequest.where(to_user: current_user)
  end


  def create
    @requested_user = User.find(params[:to_user_id])
    
    if !current_user.nil? && !@requested_user.nil?
      FriendshipRequest.send_friend_request(current_user, @requested_user)

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
    #creates an instance for use in the destroy.js (for undoing a friend request)
    @requested_user = User.find(params[:to_user_id]) if params[:to_user_id]

    @friendship_request = FriendshipRequest.find(params[:id])
    @friendship_request.destroy
    
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
    flash[:success] = "Your friend request has been undone!"
  end
end
