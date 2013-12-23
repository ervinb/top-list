class Poll < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true

  has_many :recipients, :dependent => :destroy
  has_many :records, :dependent => :destroy

  accepts_nested_attributes_for :records, :allow_destroy => true

end
