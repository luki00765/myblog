json.array!(@dashboard_comments) do |dashboard_comment|
  json.extract! dashboard_comment, :id
  json.url dashboard_comment_url(dashboard_comment, format: :json)
end
