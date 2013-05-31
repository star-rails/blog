class Image < ActiveRecord::Base
  	attr_accessible :title, :content, :src
 	mount_uploader :src, PhotoUploader

 	has_many :comments
end
