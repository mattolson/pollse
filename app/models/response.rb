class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  
  attr_accessible :value
  validates :value, :user, :poll, :presence => true
end
