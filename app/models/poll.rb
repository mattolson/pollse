class Poll < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  
  has_many   :responses, :dependent => :destroy

  validates  :user_id,        :presence     => true
  validates  :question,       :presence     => true
  validates  :response_limit, :numericality => {:only_integer => true,
                                                :greater_than => 0,
                                                :allow_blank  => true}
  
  attr_accessible :question_attributes,
                  :start_at,
                  :end_at,
                  :response_limit,
                  :distribute,
                  :featured,
                  :reveal_results,
                  :vanity,
                  :enabled

  accepts_nested_attributes_for :question

  default_scope order('created_at desc')
  scope :active, where(
      'enabled = ?', true
    ).where(
      'start_at is null or start_at <= ?', Time.now
    ).where(
      'end_at is null or end_at >= ?', Time.now
    ).where(
      'response_limit is null or (select count(id) from responses r where r.poll_id = id) < response_limit'
    )
                  
  def active?
    return if !self.enabled
    return if self.start_at       && self.start_at > Time.now
    return if self.end_at         && self.end_at   < Time.now
    return if self.response_limit && self.responses.count >= self.response_limit
    
    true
  end

  def metrics
    self.question.question_options.map do |option|
      self.responses.where(:value => option.response_value).count
    end
  end

  def activate!
    return if self.enabled
    PointTransaction.transact!(self.user, :standard_poll) 
    self.update_attribute(:enabled, true)
  end

  def to_s
    self.question.try(:body)
  end
end
