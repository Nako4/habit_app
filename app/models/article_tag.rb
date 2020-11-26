class ArticleTag
  include ActiveModel::Model
  attr_accessor :title, :output, :action, :tag_name
  
  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :output, length: { maximum: 400 }
  end



  def save
    article = Article.create(title: title, output: output, action: action)
    tag = Tag.create(tag_name: tag_name)
    ArticleTagRelation.create(article_id: article.id, tag_id: tag.id)
  end

end