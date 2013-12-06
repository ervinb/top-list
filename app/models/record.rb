class Record < ActiveRecord::Base
  belongs_to :poll
  has_many :scores
end
