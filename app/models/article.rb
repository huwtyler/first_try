class Article < ApplicationRecord
    include Visible
  
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :body, presence: true, length: { maximum: 140 }
  end
  