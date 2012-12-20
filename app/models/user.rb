class User < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me

  has_many :comments

  def admin?
    self.email == "adamwong246@gmail.com@gmail.com" 
  end

  def identify
    "guy incognito"

  end

end