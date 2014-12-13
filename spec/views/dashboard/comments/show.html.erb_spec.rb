require 'rails_helper'

RSpec.describe "dashboard/comments/show", :type => :view do
  before(:each) do
    @dashboard_comment = assign(:dashboard_comment, Dashboard::Comment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
