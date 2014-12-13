require 'rails_helper'

RSpec.describe "dashboard/messages/index", :type => :view do
  before(:each) do
    assign(:dashboard_messages, [
      Dashboard::Message.create!(),
      Dashboard::Message.create!()
    ])
  end

  it "renders a list of dashboard/messages" do
    render
  end
end
