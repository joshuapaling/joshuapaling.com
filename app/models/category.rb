class Category < ActiveRecord::Base
  attr_accessible :name, :slug
  has_many :categorizations
  has_many :posts, :through => :categorizations

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug
end
