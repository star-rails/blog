class User < ActiveRecord::Base
  attr_accessible :email, :name ,:password, :photo

  mount_uploader :photo, PhotoUploader

end
