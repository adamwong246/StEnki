class User < ActiveRecord::Base
  include RailsSettings::Extend 
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :registerable, :recoverable, 
  devise :database_authenticatable, 
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def admin?
    self.email == "adamwong246@gmail.com"
  end

  def guest?
    self.email == "guest@gmail.com"
  end
  
end
