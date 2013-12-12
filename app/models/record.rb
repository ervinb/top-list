class Record < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :poll
  has_many :scores

end
