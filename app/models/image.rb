class Image < ActiveRecord::Base
  	attr_accessible :title, :content, :src
 	mount_uploader :src, PhotoUploader
end
