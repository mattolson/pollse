class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :responses,          :dependent => :destroy
  has_many :questions,          :dependent => :destroy
  has_many :polls,              :dependent => :destroy
  has_many :point_transactions, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
    
  def points
    self.point_transactions.sum(:points) + self.responses.count
  end

  def guest?
    self.email.end_with?('@example.com')
  end
end
