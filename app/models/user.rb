class User < ActiveRecord::Base
  attr_accessible :email, :name ,:password
  def authenticate(password)
  	password == self.password
  end
end
