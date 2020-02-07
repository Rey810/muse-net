class FriendshipsController < ApplicationController
    def create
        @requestor = User.find(params[:friend_id])

        if !current_user.nil? && !@requestor.nil? 
            Friendship.make_friendship(current_user, @requestor)
            FriendshipRequest.delete_request(current_user, @requestor)
            flash[:success] = "You are now friends!"
            redirect_back(fallback_location: root_path)
        else
            flash[:notice] = "It seems your friend doesn't actually exist :("
            redirect_back(fallback_location: root_path)
        end

    end
end
