require 'rails_helper'

RSpec.describe "dashboard/comments/index", :type => :view do
  before(:each) do
    assign(:dashboard_comments, [
      Dashboard::Comment.create!(),
      Dashboard::Comment.create!()
    ])
  end

  it "renders a list of dashboard/comments" do
    render
  end
end
