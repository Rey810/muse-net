class FriendshipsController < ApplicationController
    #This is all for CREATING FRIENDSHIPS. WHAT TO DO WHEN USER CLICKS "ACCEPT" FRIEND REQUEST
#    def create
#        @requested_friend = User.find(params[:to_user])
#
#        if !current_user.nil? && !@requested_friend.nil? 
#            make_friendship(current_user, @requested_friend)
#        else
#            flash[:notice] = "It seems your friend doesn't actually exist :("
#            redirect_back(fallback_location: root_path)
#        end
#    end

end
