require 'rails_helper'

RSpec.describe "Dashboard::Messages", :type => :request do
  describe "GET /dashboard_messages" do
    it "works! (now write some real specs)" do
      get dashboard_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
