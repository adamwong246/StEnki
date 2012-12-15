class User < ActiveRecord::Base
  devise :omniauthable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :services, :dependent => :destroy
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, :shortbio, :weburl

  def admin?
    self.email == "zephram.cochrane.ncc.1701@gmail.com"
  end
 
  def guest?
    self.email == "guest@gmail.com"
  end

end