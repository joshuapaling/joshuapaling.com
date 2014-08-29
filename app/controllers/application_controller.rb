class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :load_categories

  def load_categories
    @test_string = "Hello World"
    @categories_all = Category.all
  end

end
