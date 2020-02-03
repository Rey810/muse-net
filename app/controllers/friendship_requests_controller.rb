class FriendshipRequestsController < ApplicationController
  def create
    @requested_user = User.find(params[:to_user_id])

    if !current_user.nil? && !@requested_user.nil?
      send_friend_request(current_user, @requested_user)
      redirect_back(fallback_location: root_path)
      flash[:success] = "Your friend request has been sent!"
    else
      flash[:notice] = "It seems you can't add this person as a friend."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end
end
