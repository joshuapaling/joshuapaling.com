class Image < ActiveRecord::Base
  attr_accessible :alt, :image
  mount_uploader :image, ImageUploader
end
