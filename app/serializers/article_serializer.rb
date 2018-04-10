class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :author, :body, :quote, :images
  has_many :images

end
