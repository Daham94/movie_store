json.extract! customer, :id, :name, :email, :password_digest, :created_at, :updated_at
json.url customer_url(customer, format: :json)
