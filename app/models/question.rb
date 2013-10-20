class Question < ActiveRecord::Base
  has_many   :question_options,     :dependent  => :destroy,
                                    :inverse_of => :question
  has_many   :polls,                :dependent  => :destroy
  has_many   :category_assignments, :dependent  => :destroy
  has_many   :categories,           :through    => :category_assignments
  
  validates :body,    :presence => true
  validate  :minimum_options, :maximum_options

  
  accepts_nested_attributes_for :question_options, :allow_destroy => true, 
                                                   :reject_if     => proc { |attrs| attrs['response_value'].blank? }
  
  attr_accessible :body,
                  :question_options_attributes
  private
    def minimum_options
      errors.add('', "must provide at least two options") if question_options.size < 2
    end

    def maximum_options
      errors.add('', "must provide 10 or less options") if question_options.size > 10
    end
end
