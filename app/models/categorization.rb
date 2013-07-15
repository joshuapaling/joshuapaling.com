class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :post_id
  belongs_to :category
  belongs_to :post
end
