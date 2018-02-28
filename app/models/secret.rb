class Secret < ActiveRecord::Base
  validates :user, :content, presence: true

  # A SECRET:
  #   belongs_to a User
  belongs_to :user

  #   has_many TOTAL Likes
  has_many :likes, dependent: :destroy # IF SECRET IS DELETED, SO ARE THE LIKES FOR IT!
  
  #   has_many Users (who liked it)! 
  # ( associated with User's ."secrets_liked" )
  has_many :users, through: :likes 
end
