json.array!(@dashboard_messages) do |dashboard_message|
  json.extract! dashboard_message, :id
  json.url dashboard_message_url(dashboard_message, format: :json)
end
