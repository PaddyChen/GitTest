json.array!(@products) do |product|
  json.extract! product, :title, :description, :img_url
  json.url product_url(product, format: :json)
end
