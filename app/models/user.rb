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
  has_many :friendship_requests,                    dependent: :destroy
  has_many :pending_friendships, through: :friendship_requests, source: :to_user
end
