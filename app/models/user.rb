class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me, :name, :bootswatch_theme, :password, :password_confirmation

  has_many :comments
  # has_many :services
  has_many :identities

  def self.create_with_omniauth(info)
    create(name: info['name'])
  end

  def admin?
    self.email == "adamwong246@gmail.com" 
  end

  def identify
    if self.name?
      self.name
    elsif self.email?
      self.email
    else
      "User # #{self.id}"
    end
    
  end

end