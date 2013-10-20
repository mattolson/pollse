class QuestionOption < ActiveRecord::Base
  belongs_to :question
  
  validates :question,       :presence   => true
  validates :response_value, :presence   => true
  
  attr_accessible :response_value
  
  def to_s
    self.response_value
  end
end
