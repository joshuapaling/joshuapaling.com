class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :force_www!
  before_action :load_categories

  def load_categories
    @test_string = "Hello World"
    @categories_all = Category.all
  end

  protected

  def force_www!
    if Rails.env.production? and request.host[0..3] != "www."
      redirect_to "#{request.protocol}www.#{request.host_with_port}#{request.fullpath}", :status => 301
    end
  end

end
