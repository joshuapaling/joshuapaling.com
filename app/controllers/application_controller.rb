class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :load_categories

  def load_categories
    @categories_all = Category.all
  end

end
