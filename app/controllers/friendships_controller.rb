class FriendshipsController < ApplicationController
    def create
        @requestor = User.find(params[:friend_id])
        @friendship_request = FriendshipRequest.find_by(user: @requestor)

        if !current_user.nil? && !@requestor.nil? 
            Friendship.make_friendship(current_user, @requestor)
            FriendshipRequest.delete_request(current_user, @requestor)
            
            respond_to do |format|
                format.html { redirect_back(fallback_location: root_path) }
                format.js
            end

            flash[:success] = "You are now friends!"
        else
            flash[:notice] = "It seems your friend doesn't actually exist :("
            redirect_back(fallback_location: root_path)
        end

    end

    def destroy
        @friendship_to_destroy = Friendship.find(params[:id])
        @friendship_to_destroy.destroy

        respond_to do |format|
            format.html { redirect_back(fallback_location: root_path) }
            format.js
        end
        
    end
end
