class Category < ActiveRecord::Base
  has_many :category_assignments, :dependent => :destroy
  has_many :questions,            :through   => :category_assignments
  
  attr_accessible :name
end
