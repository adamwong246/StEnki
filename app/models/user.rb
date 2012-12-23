class User < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me, :name, :bootswatch_theme

  has_many :comments
  has_many :services

  def admin?
    self.email == "adamwong246@gmail.com@gmail.com" 
  end

  def identify
    if self.name?
      self.name
    elsif self.email?
      self.email
    else
      self.inspect
    end
    
  end

end