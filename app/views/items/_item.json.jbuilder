json.extract! item, :id, :title, :url, :created_at, :updated_at
json.url item_url(item, format: :json)
