json.extract! inventory, :id, :price, :total_copies, :barcode_no, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
