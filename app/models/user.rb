class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :posts,                                  dependent: :destroy
  has_many :likes,                                  dependent: :destroy
  has_many :comments,                               dependent: :destroy
  has_many :friendships,                            dependent: :destroy
  has_many :friends, through: :friendships
  # the friendship request details
  has_many :friendship_requests,                    dependent: :destroy
  # the users who requests were sent to 
  has_many :pending_friendships, through: :friendship_requests, source: :to_user

  #checks if user is included in the list of friends for current_user
  def friends?(user)
    friends.include?(user)
  end

  def num_of_friendship_requests
    FriendshipRequest.where(to_user: self).count
  end

  def pluralized_friendship_requests_to_string
    num = self.num_of_friendship_requests
    friend_requests = "friend request".pluralize(num)
    string = "#{num} #{friend_requests}"
  end

  def any_friend_requests?
        FriendshipRequest.exists?(to_user: self)
  end
end
