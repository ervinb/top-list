class Poll < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true

  has_many :recipients, :dependent => :destroy
  has_many :entries, :dependent => :destroy

  accepts_nested_attributes_for :entries, :allow_destroy => true

end
