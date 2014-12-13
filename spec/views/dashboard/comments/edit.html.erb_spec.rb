require 'rails_helper'

RSpec.describe "dashboard/comments/edit", :type => :view do
  before(:each) do
    @dashboard_comment = assign(:dashboard_comment, Dashboard::Comment.create!())
  end

  it "renders the edit dashboard_comment form" do
    render

    assert_select "form[action=?][method=?]", dashboard_comment_path(@dashboard_comment), "post" do
    end
  end
end
