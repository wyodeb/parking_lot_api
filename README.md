# Parking Lot API
Backend API for a parking lot system.

## Requirements
- Ruby 3.4.x
- Rails 8.x
- SQLite (default Rails DB)

## Setup
```bash
bundle install
bin/rails db:create db:migrate
bin/rails s
```

## API

### Task 1 — Issue a Ticket

- **Endpoint:** `POST /api/tickets`  
- **Description:** Creates a new parking ticket with a unique 16-digit hex barcode and timestamp.  
- **Response (201):**
```json
{
  "barcode": "07d3cc999dd052e6",
  "issued_at": "2025-09-19T15:56:22Z"
}
