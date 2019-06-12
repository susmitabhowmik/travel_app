json.array! @response.each do |place|
  json.name place["name"]
  json.location place["name_suffix"]
  json.categories place["categories"]
  json.thumbnail place["thumbnail_url"]
  json.url place["url"]
end