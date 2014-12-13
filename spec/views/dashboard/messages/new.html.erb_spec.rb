require 'rails_helper'

RSpec.describe "dashboard/messages/new", :type => :view do
  before(:each) do
    assign(:dashboard_message, Dashboard::Message.new())
  end

  it "renders new dashboard_message form" do
    render

    assert_select "form[action=?][method=?]", dashboard_messages_path, "post" do
    end
  end
end
