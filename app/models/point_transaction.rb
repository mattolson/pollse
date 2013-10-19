class PointTransaction < ActiveRecord::Base
  belongs_to :user
  attr_accessible :points, :transaction_type
end
