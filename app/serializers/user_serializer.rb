class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :mag_title, :mag_url, :mag_description, :articles
  has_many :articles
end
