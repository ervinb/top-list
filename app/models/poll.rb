class Poll < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true

  has_many :recipients, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :scores, :through => :entries

  accepts_nested_attributes_for :entries, :allow_destroy => true
  accepts_nested_attributes_for :recipients, :allow_destroy => true

  def build_scores(entry_ids, token, current_user)

    return false if not current_user.nil? and current_user.poll_owner(id)

    entries.find(entry_ids).each_with_index do |entry, index|
      entry.scores.build(:value => index, :token => token)
      entry.save!
    end

  end

  def lock
    update_column(:locked, !locked)
    locked
  end

  def permanent_lock
    invites_sent
  end

  def invite_recipients

    if recipients.present?
      recipients.each do |recipient|
        recipient.token = SecureRandom.hex(12)
        recipient.save
      end

      update_column(:invites_sent, true)

      # send emails logic here WIP

    end

  end

  def invites_count
    recipients.count
  end

  def votes_count
    scores.group(:token).length
  end

end
