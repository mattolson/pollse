class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  
  has_many   :responses, :dependent => :destroy

  validates  :user_id,        :presence     => true
  validates  :question_id,    :presence     => true
  validates  :response_limit, :numericality => {:only_integer => true,
                                                :greater_than => 0,
                                                :allow_blank  => true}
  
  attr_accessible :question_id,
                  :start_at,
                  :end_at,
                  :response_limit,
                  :distribute,
                  :featured,
                  :reveal_results,
                  :vanity,
                  :enabled
                  
  def open?
    return if !self.enabled
    return if self.start_at       && self.start_at > Time.now
    return if self.end_at         && self.end_at   < Time.now
    return if self.response_limit && self.responses.count >= self.response_limit
    
    true
  end
  
  def closed?
    !open?
  end
  
end
