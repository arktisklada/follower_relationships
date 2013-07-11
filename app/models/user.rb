class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #when user is a follower they have follower_relationships that point to users they're following
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :followings, through: :follower_relationships, class_name: "User", foreign_key: "following_id"

  #when user is following he has following_relationships that that point to followers of that user
  has_many :following_relationships, class_name: "Relationship", foreign_key: "following_id"
  has_many :followers, through: :following_relationships, class_name: "User", foreign_key: "follower_id"
end