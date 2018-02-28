class Like < ActiveRecord::Base
  belongs_to :user  # how many likes user perfomed
  belongs_to :secret # how many likes a secret has
end
