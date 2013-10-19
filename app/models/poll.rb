class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :distribute, :end_at, :featured, :response_limit, :reveal_results, :start_at, :vanity
end
