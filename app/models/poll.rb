class Poll < ActiveRecord::Base
  belongs_to :user
  has_many :recipients
  has_many :records

  accepts_nested_attributes_for :records
end
