class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :retweets, -> { where interaction_type: 'retweet'}, class_name: 'Interaction', foreign_key: 'user_id', dependent: :destroy
  has_many :likes, -> { where interaction_type: 'like'}, class_name: 'Interaction', foreign_key: 'user_id', dependent: :destroy

  has_many :followers, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followees, class_name: 'Follow', foreign_key: 'followee_id'

  def following?(followee, follower)
    Follow.exists?(followee: follower, follower: followee)
  end
end
