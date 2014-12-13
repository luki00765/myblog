require 'rails_helper'

RSpec.describe "dashboard/messages/edit", :type => :view do
  before(:each) do
    @dashboard_message = assign(:dashboard_message, Dashboard::Message.create!())
  end

  it "renders the edit dashboard_message form" do
    render

    assert_select "form[action=?][method=?]", dashboard_message_path(@dashboard_message), "post" do
    end
  end
end
