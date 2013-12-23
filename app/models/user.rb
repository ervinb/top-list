class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :polls
  has_many :recipients, through: :polls

  def poll_owner(poll_id)
    polls.where( :user_id => id ).exists?
  end
end
