class AdminUser < ActiveRecord::Base
  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def name
    email
  end
end
