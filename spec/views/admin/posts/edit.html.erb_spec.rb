require 'spec_helper'

describe "admin/posts/edit" do
  before(:each) do
    @admin_post = assign(:admin_post, stub_model(Admin::Post))
  end

  it "renders the edit admin_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_post_path(@admin_post), "post" do
    end
  end
end
