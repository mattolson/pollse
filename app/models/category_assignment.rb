class CategoryAssignment < ActiveRecord::Base
  belongs_to :question
  belongs_to :category
  # attr_accessible :title, :body
end
