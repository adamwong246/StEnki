class Service < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid, :uname, :uemail

  def identify
    return "some serivce"
    
  end
end
