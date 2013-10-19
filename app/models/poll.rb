class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  
  has_many   :responses, :dependent => :destroy
  
  attr_accessible :start_at,
                  :end_at,
                  :response_limit,
                  :distribute,
                  :featured,
                  :reveal_results,
                  :vanity
end
