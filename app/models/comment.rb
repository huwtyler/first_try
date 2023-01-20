class Comment < ApplicationRecord
  include Visible

  belongs_to :article
  belongs_to :user

  validates :body, presence: true, length: { maximum: 140 }
end
