class Recipient < ActiveRecord::Base
  belongs_to :poll

  validates :email, :presence => true

  def has_voted(poll_id)
    poll = Poll.find(poll_id)  
    poll.scores.where(:token => token).exists? 
  end
    
end
