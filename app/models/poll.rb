class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :recipients
  has_many :scores
end
