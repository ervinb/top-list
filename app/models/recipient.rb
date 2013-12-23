class Recipient < ActiveRecord::Base
  belongs_to :poll

  validates :email, :presence => true
end
