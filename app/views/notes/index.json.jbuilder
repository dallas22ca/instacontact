json.array!(@notes) do |note|
  json.extract! note, :client_id, :body
  json.url note_url(note, format: :json)
end
