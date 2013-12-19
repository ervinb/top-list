class Poll < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true

  has_many :recipients, :dependent => :destroy
  has_many :entries, :dependent => :destroy

  accepts_nested_attributes_for :entries, :allow_destroy => true

  def build_scores(entry_ids)

    entries.find(entry_ids).each_with_index do |entry, index|
      entry.scores.build(:value => index)
      entry.save!
    end

  end

  def lock
    update_column(:locked, !locked)
    locked
  end

end
