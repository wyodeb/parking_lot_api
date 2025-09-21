require "rails_helper"

RSpec.describe "Tickets API", type: :request do
  describe "POST /api/tickets" do
    it "creates a ticket and returns barcode + issued_at" do
      post "/api/tickets"

      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["barcode"]).to match(/\A\h{16}\z/)
      expect(json["issued_at"]).to be_present
    end

    it "returns JSON content type" do
      post "/api/tickets"
      expect(response.media_type).to eq("application/json")
    end
  end
end

