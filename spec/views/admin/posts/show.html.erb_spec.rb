require 'spec_helper'

describe "admin/posts/show" do
  before(:each) do
    @admin_post = assign(:admin_post, stub_model(Admin::Post))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
