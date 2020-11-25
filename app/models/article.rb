class Article < ApplicationRecord
  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :output, length: { maximum: 400 }
  end

  has_many :article_tag_relations
  has_many :tags, through: :article_tag_relations
end
