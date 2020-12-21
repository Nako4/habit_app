class Article < ApplicationRecord
  has_many :article_tag_relations, dependent: :destroy
  has_many :tags, through: :article_tag_relations
  has_one :habit
  belongs_to :user

  def self.search(search)
    if search
      Article.where(['title LIKE(?) OR output LIKE (?) ', "%#{search}%", "%#{search}%"])
    else
      Article.all
    end
  end
end
