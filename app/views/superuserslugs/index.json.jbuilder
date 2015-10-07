json.array!(@superuserslugs) do |superuserslug|
  json.extract! superuserslug, :id, :name, :slug
  json.url superuserslug_url(superuserslug, format: :json)
end
