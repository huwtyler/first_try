class Article < ApplicationRecord
    include Visible
  
    has_many :comments, dependent: :destroy
    has_many :interactions, dependent: :destroy
    belongs_to :user

    validates :body, presence: true, length: { maximum: 140 }

    def retweet_count
      self.interactions.where(interaction_type: 'retweet').count
    end
  
    def like_count
      where(interaction_type: 'like').count
    end
  end
  