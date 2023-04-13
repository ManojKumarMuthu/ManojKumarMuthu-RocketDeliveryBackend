json.extract! courier, :id, :user_id, :address_id, :courier_status_id, :phone, :email, :active, :created_at, :updated_at
json.url courier_url(courier, format: :json)
