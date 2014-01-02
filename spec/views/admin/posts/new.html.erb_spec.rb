require 'spec_helper'

describe "admin/posts/new" do
  before(:each) do
    assign(:admin_post, stub_model(Admin::Post).as_new_record)
  end

  it "renders new admin_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_posts_path, "post" do
    end
  end
end
