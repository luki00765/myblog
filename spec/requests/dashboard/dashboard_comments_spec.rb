require 'rails_helper'

RSpec.describe "Dashboard::Comments", :type => :request do
  describe "GET /dashboard_comments" do
    it "works! (now write some real specs)" do
      get dashboard_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
