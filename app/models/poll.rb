class Poll < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true

  has_many :recipients, :dependent => :destroy
  has_many :entries, :dependent => :destroy

  accepts_nested_attributes_for :entries, :allow_destroy => true
  accepts_nested_attributes_for :recipients, :allow_destroy => true

  def build_scores(entry_ids, token)
    entries.find(entry_ids).each_with_index do |entry, index|
      entry.scores.build(:value => index, :token => token)
      entry.save!
    end

  end

  def lock
    update_column(:locked, !locked)
    locked
  end

  def invite_recipients
    if recipients.present?
      recipients.each do |recipient|
        recipient.token = SecureRandom.hex(12)
        recipient.save
      end

      # send emails logic here WIP
      
    end
    
  end

end
