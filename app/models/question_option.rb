class QuestionOption < ActiveRecord::Base
  belongs_to :question
  
  attr_accessible :response_value
  
  def to_s
    self.response_value
  end
end
