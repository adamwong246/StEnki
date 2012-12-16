class Service < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid, :uname, :uemail

  def identify
    return self.provider + self.uid + self.uname + self.uemail
  end
end
