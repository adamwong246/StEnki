class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me, :name, :bootswatch_theme, :password, :password_confirmation, :experimental_mode

  has_many :comments
  # has_many :services
  # has_many :identities

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