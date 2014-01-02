require 'spec_helper'

describe "admin/posts/index" do
  before(:each) do
    assign(:admin_posts, [
      stub_model(Admin::Post),
      stub_model(Admin::Post)
    ])
  end

  it "renders a list of admin/posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
