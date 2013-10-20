class Question < ActiveRecord::Base
  belongs_to :user
  
  has_many   :question_options,     :dependent  => :destroy,
                                    :inverse_of => :question
  has_many   :polls,                :dependent  => :destroy
  has_many   :category_assignments, :dependent  => :destroy
  has_many   :categories,           :through    => :category_assignments
  
  validates :user_id, :presence => true
  validates :body,    :presence => true
  
  accepts_nested_attributes_for :question_options, :allow_destroy => true, 
                                                   :reject_if     => proc { |attrs| attrs['response_value'].blank? }
  
  attr_accessible :body,
                  :question_options_attributes
end
