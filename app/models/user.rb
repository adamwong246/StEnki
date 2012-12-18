class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me
  rolify
  # devise :omniauthable, :rememberable, :trackable, :lockable

  has_many :services, :dependent => :destroy
  has_many :comments
  
  attr_accessible :email, :remember_me, :fullname, :shortbio, :weburl, :bootswatch_theme

  def admin?
    self.email == "adamwong246@gmail.com@gmail.com" || self.services.any?{|e| e.uid == "http://adamwong246.myopenid.com/"}
  end

  def identify
    if self.email?
      return self.email
    elsif self.name?
      return self.name
    else
      return self.services[0].identify
    end

  end

end