class User < ApplicationRecord
has_many :articles
has_secure_password

def images
  images = []
  self.articles.each do |article|
    article.images.each do |image|
      images.push(image)
    end
  end
  images
end


end
