class User < ApplicationRecord
  #after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_many :posts,                                  dependent: :destroy
  has_many :likes,                                  dependent: :destroy
  has_many :comments,                               dependent: :destroy
  has_many :friendships,                            dependent: :destroy
  has_many :friends, through: :friendships
  # the friendship request details
  has_many :friendship_requests,                    dependent: :destroy
  # the users who requests were sent to 
  has_many :pending_friendships, through: :friendship_requests, source: :to_user

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
  
  #checks if user is included in the list of friends for current_user
  def friends?(user)
    friends.include?(user)
  end

  def num_of_friendship_requests
    FriendshipRequest.where(to_user: self).count
  end

  def any_friend_requests?
    FriendshipRequest.exists?(to_user: self)
  end

  def feed
    #select the posts from friends
    #current implementation is clumsy and will be slow with many posts.
    #When refactoring, try to use a subselect to increase db efficiency
    #friend_ids = "SELECT friend_id FROM friendships WHERE user_id etc."
    friend_ids = self.friends.ids
    Post.where("user_id IN (?) OR user_id = ?", friend_ids, self.id) 
  end

  def self.from_omniauth(auth)
    #auth is a hash
    #first_or_create sets the provider and uid fields automatically
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end
end
