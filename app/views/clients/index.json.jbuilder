json.array!(@clients) do |client|
  json.extract! client, :name, :company, :email, :phone, :initiated_by, :state
  json.url client_url(client, format: :json)
end
