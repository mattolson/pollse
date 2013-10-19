class TransactionType < ActiveRecord::Base
  has_many :transactions, :dependent => :nullify
  has_many :offers,       :dependent => :destroy
  
  validates :name,       :presence     => true,
                         :uniqueness   => {:case_sensitive => false}
  validates :points,     :presence     => true,
                         :numericality => {:integer_only   => true }
  
  attr_accessible :name,
                  :points,
                  :repeatable
end
