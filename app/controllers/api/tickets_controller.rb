class Api::TicketsController < ApplicationController
  def create
    ticket = Ticket.issue!
    render json: { barcode: ticket.barcode, issued_at: ticket.issued_at.iso8601}, status: :created
  end
end
