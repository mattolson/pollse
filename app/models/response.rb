class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  
  attr_accessible :value
  validates :value, :user, :poll, :presence => true
  validates :poll_id, :uniqueness => {:scope => :user_id}
end
