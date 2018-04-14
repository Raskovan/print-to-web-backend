class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :author, :body, :quote, :subtitle, :images, :img_name
  has_many :images

end
