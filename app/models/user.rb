class User < ActiveRecord::Base
  # devise :omniauthable, :rememberable, :trackable, :lockable

  has_many :services, :dependent => :destroy
  has_many :comments
  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, :shortbio, :weburl

  def admin?
    self.email == "adamwong246@gmail.com@gmail.com" || self.services.any?{|e| e.uid == "http://adamwong246.myopenid.com/"}
  end

  def identify
    if self.email?
      return self.email?
    elsif self.fullname?
      return self.fullname
    else
      return self.services.first.identify
    end

  end

end