json.array!(@magzines) do |magzine|
  json.extract! magzine, :id, :title, :description, :user_id
  json.url magzine_url(magzine, format: :json)
end
