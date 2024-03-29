require 'rails_helper'

RSpec.describe "dashboard/comments/new", :type => :view do
  before(:each) do
    assign(:dashboard_comment, Dashboard::Comment.new())
  end

  it "renders new dashboard_comment form" do
    render

    assert_select "form[action=?][method=?]", dashboard_comments_path, "post" do
    end
  end
end
