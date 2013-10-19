class Question < ActiveRecord::Base
  belongs_to :user
  
  has_many   :question_options,     :dependent => :destroy
  has_many   :polls,                :dependent => :destroy
  has_many   :category_assignments, :dependent => :destroy
  has_many   :categories,           :through   => :category_assignments
  
  validates :body, :presence => true
  
  attr_accessible :body
end
