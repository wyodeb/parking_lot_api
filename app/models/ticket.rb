class Ticket < ApplicationRecord
  HEX16 = /\A\h{16}\z/
  validates :barcode, presence: true, uniqueness: true, format: { with: HEX16 }
  validates :issued_at, presence: true

  def self.issue!
    create!(barcode: SecureRandom.hex(8), issued_at: Time.current)
  end
end
