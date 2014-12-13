require 'rails_helper'

RSpec.describe "dashboard/messages/show", :type => :view do
  before(:each) do
    @dashboard_message = assign(:dashboard_message, Dashboard::Message.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
