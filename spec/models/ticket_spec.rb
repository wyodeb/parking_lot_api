require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe ".issue!" do
    it "creates a persisted ticket with 16-hex barcode and issued_at" do
      ticket = described_class.issue!
      expect(ticket).to be_persisted
      expect(ticket.barcode).to match(/\A\h{16}\z/)
      expect(ticket.issued_at).to be_within(1.second).of(Time.current)
    end

    it "generates unique barcodes" do
      a = described_class.issue!
      b = described_class.issue!
      expect(a.barcode).not_to eq(b.barcode)
    end
  end

  describe "validations" do
    it "requires 16-hex barcode format" do
      t = described_class.new(barcode: "nothex", issued_at: Time.current)
      expect(t).to be_invalid
      expect(t.errors[:barcode]).to be_present
    end

    it "enforces uniqueness at model level" do
      code = SecureRandom.hex(8)
      described_class.create!(barcode: code, issued_at: Time.current)
      dup = described_class.new(barcode: code, issued_at: Time.current)
      expect(dup).to be_invalid
      expect(dup.errors[:barcode]).to include("has already been taken")
    end
  end
end
