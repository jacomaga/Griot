class PublisherSerializer
  include JSONAPI::Serializer
  attributes :name, :description
  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
