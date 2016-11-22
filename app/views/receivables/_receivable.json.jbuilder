json.extract! receivable, :id, :company_id, :receiveable_amount, :check_date, :transaction_date, :remarks, :created_at, :updated_at
json.url receivable_url(receivable, format: :json)