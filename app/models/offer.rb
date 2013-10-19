class Offer < ActiveRecord::Base
  scope :displayed, where(:display => true)
  
  scope :active, where(
                   'start_at is null or start_at <= ?', Time.now
                 ).where(
                   'end_at is null or end_at >= ?', Time.now
                 )
  
  
  belongs_to :transaction_type
  
  validates :transaction_type_id, :presence     => true
  validates :name,                :presence     => true
  validates :price,               :presence     => true,
                                  :numericality => {:greater_than_or_equal_to => 0}
  
  attr_accessible :transaction_type_id,
                  :name,
                  :price,
                  :display,
                  :start_at,
                  :end_at
                  
  delegate :points, :to => :transaction_type

  def active?
    return if self.start_at && self.start_at > Time.now
    return if self.end_at   && self.end_at   < Time.now
  
    true
  end
  
  def buy!(user)
    PointTransaction.transact!(user, self.transaction_type.name)
  end
  
  def free?
    self.price.blank? || self.price <= 0
  end
end
