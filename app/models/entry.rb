class Entry < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :poll

  has_many :scores

  def total_score
    sum = 0
    scores.each do |score_instance|
      sum += score_instance.score
    end

    sum 
  end

end
