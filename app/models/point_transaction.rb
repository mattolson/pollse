class PointTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :transaction_type
  
  validates :user_id,             :presence     => true
  validates :transaction_type_id, :presence     => true,
                                  :uniqueness   => {:scope => :user_id,
                                                    :if    => "!transaction_type.repeatable?"}
  validates :points,              :presence     => true,
                                  :numericality => {:only_integer => true}
  
  attr_accessible :transaction_type_id,
                  :points
                  
  def self.transact!(user, type_name, points=nil)
    return unless user
    return unless transaction_type = TransactionType.find_by_name(type_name.to_s)
    
    point_transaction = user.point_transactions.build(:transaction_type_id => transaction_type.id,
                                                      :points              => points || transaction_type.points)
    
    point_transaction.save
  end                  
end
