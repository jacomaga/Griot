class PictureSerializer
  include JSONAPI::Serializer
  attributes :description, :url, :category
  belongs_to :publisher

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
