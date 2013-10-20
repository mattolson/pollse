class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  extend FriendlyId
  friendly_id :username, :use => :slugged

  has_many :responses,          :dependent => :destroy
  has_many :polls,              :dependent => :destroy
  has_many :point_transactions, :dependent => :destroy

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  after_create :add_signup_points
    
  def points
    self.point_transactions.sum(:points) + self.responses.count
  end

  def guest?
    self.email.end_with?('@example.com')
  end
  
  def add_signup_points
    # TODO: Figure out how the guest user works in this workflow??
    PointTransaction.transact!(self, :sign_up)
  end

  def answered?(poll)
    self.responses.where(:poll_id => poll.id).count > 0
  end
  
  def move_assets_from(old_user)
    Response.where(:user_id => old_user.id).update_all(:user_id => self.id)
    Poll.where(    :user_id => old_user.id).update_all(:user_id => self.id)
  end
  
  def to_s
    username || email
  end
end
