class ImageSerializer < ActiveModel::Serializer
  attributes :id, :article_id, :url, :caption, :position, :handle
end
