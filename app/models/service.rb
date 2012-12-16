class Service < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid, :uname, :uemail

  def identify
    return self.provider.to_s 
        + self.uid.to_s
        + self.uname.to_s
        + self.uemail.to_s
    
  end
end
